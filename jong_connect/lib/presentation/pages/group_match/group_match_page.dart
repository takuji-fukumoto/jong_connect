import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:async_value_group/async_value_group.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/group_match.dart';
import 'package:jong_connect/domain/provider/group_match_players.dart';
import 'package:jong_connect/usecase/group_match_results_use_case.dart';
import 'package:jong_connect/util/constants.dart';
import 'package:jong_connect/util/expect.dart';

import '../../../domain/model/app_user.dart';
import '../../../domain/model/group_match.dart';
import '../../../util/routing_path.dart';

class GroupMatchPage extends ConsumerWidget {
  const GroupMatchPage(
      {super.key, required this.groupId, required this.groupMatchId});

  final int groupId;
  final int groupMatchId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueGroup.group2(
      ref.watch(groupMatchPlayersProvider(groupId)),
      ref.watch(groupMatchProvider(groupMatchId: groupMatchId)),
    ).when(
      data: (values) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              if (!values.$2.isFinish)
                TextButton(
                  onPressed: () async {
                    final result = await showOkCancelAlertDialog(
                        context: context, message: '対局を終了します');

                    if (result.name != 'ok') {
                      return;
                    }

                    ref
                        .watch(groupMatchResultsUseCaseProvider)
                        .closeMatch(values.$2);
                    context.pop();
                    SnackBarService.showSnackBar(content: '対局結果を記録しました');
                  },
                  child: const Text('対局終了'),
                ),
            ],
          ),
          body: _ResultTable(
            players: values.$1,
            groupId: groupId,
            groupMatch: values.$2,
          ),
          floatingActionButton: !values.$2.isFinish
              ? FloatingActionButton(
                  elevation: 1.5,
                  onPressed: () {
                    context.goNamed(
                      RoutingPath.inputGroupMatchScore,
                      pathParameters: {
                        'groupId': groupId.toString(),
                        'groupMatchId': groupMatchId.toString(),
                      },
                      queryParameters: {
                        'matchOrder': (values.$2.maxRounds + 1).toString(),
                      },
                    );
                  },
                  child: const Icon(Icons.add),
                )
              : const SizedBox(),
        );
      },
      error: (error, st) {
        print(st);
        return const Center(child: Text('Oops, something unexpected happened'));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _ResultTable extends ConsumerWidget {
  const _ResultTable(
      {super.key,
      required this.players,
      required this.groupId,
      required this.groupMatch});

  final List<AppUser> players;
  final int groupId;
  final GroupMatch groupMatch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPointsPerUser = groupMatch.totalPointsPerUser;
    final pointsPerRounds = groupMatch.pointsPerRound;

    /// グループに参加しているユーザーとグループから退会したが記録に残っているユーザーを全て表示する
    var allPlayers = <AppUser>[...players, ...groupMatch.joinUsers];
    allPlayers = expect(allPlayers, (player) => player.id);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
        columnSpacing: 0,
        horizontalMargin: 0,
        columns: [
          DataColumn2(
            label: IconButton(
              onPressed: () {
                print('参加者編集ページへ遷移');
              },
              icon: const Icon(Icons.manage_accounts),
            ),
            size: ColumnSize.S,
            fixedWidth: 50,
          ),
          for (var player in allPlayers) ...[
            DataColumn2(
              label: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(player.name),
                    Text(totalPointsPerUser.keys.contains(player.id)
                        ? totalPointsPerUser[player.id].toString()
                        : 0.toString()),
                  ],
                ),
              ),
              size: ColumnSize.S,
              numeric: true,
            ),
          ],
        ],
        rows: List<DataRow>.generate(
          groupMatch.maxRounds,
          (index) => DataRow2(
            onTap: () {
              context.goNamed(
                RoutingPath.editGroupMatchScore,
                pathParameters: {
                  'groupId': groupId.toString(),
                  'groupMatchId': groupMatch.id.toString(),
                  'matchOrder': (index + 1).toString(),
                },
              );
            },
            cells: [
              DataCell(
                Center(
                  child: Text((index + 1).toString()),
                ),
              ),
              for (var player in allPlayers) ...[
                DataCell(
                  Center(
                    child: Text(
                        '${pointsPerRounds[player.id]?[index] != null ? pointsPerRounds[player.id]![index] : ''}'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
