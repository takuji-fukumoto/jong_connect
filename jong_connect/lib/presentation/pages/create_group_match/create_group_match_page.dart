import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/group_match_players.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/usecase/create_group_match_results_use_case.dart';
import 'package:jong_connect/util/constants.dart';

import '../../../domain/model/app_user.dart';
import '../../../util/routing_path.dart';

class CreateGroupMatchPage extends ConsumerWidget {
  const CreateGroupMatchPage(
      {super.key, required this.groupId, required this.type});

  final int groupId;
  final MatchType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(groupMatchPlayersProvider(groupId)),
      data: (players) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            leading: TextButton(
              onPressed: () async {
                final result = await showOkCancelAlertDialog(
                    context: context, message: '途中まで記録した内容は破棄されます');

                if (result.name != 'ok') {
                  return;
                }

                context.pop();
              },
              child: const Text('キャンセル'),
            ),
            leadingWidth: 100,
            actions: [
              TextButton(
                onPressed: () async {
                  final result = await showOkCancelAlertDialog(
                      context: context, message: '記録した内容を確定します');

                  if (result.name != 'ok') {
                    return;
                  }

                  ref
                      .watch(createGroupMatchResultsUseCaseProvider(
                              groupId, type.name)
                          .notifier)
                      .register();
                  context.pop();
                  SnackBarService.showSnackBar(content: '対局結果を記録しました');
                },
                child: const Text('保存'),
              ),
            ],
          ),
          body: _ResultTable(
            players: players,
            groupId: groupId,
            type: type,
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 1.5,
            onPressed: () {
              context.goNamed(
                RoutingPath.inputGroupMatchScore,
                pathParameters: {
                  'groupId': groupId.toString(),
                  'matchType': type.name,
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class _ResultTable extends ConsumerWidget {
  const _ResultTable(
      {super.key,
      required this.players,
      required this.groupId,
      required this.type});

  final List<AppUser> players;
  final int groupId;
  final MatchType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records =
        ref.watch(createGroupMatchResultsUseCaseProvider(groupId, type.name));
    final totalPointsPerUser = records.totalPointsPerUser;

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
          for (var player in players) ...[
            DataColumn2(
              label: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(player.name),
                    Text(totalPointsPerUser.keys.contains(player.id)
                        ? totalPointsPerUser[player.id]!
                            .reduce((a, b) => (a ?? 0) + (b ?? 0))
                            .toString()
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
          records.maxRounds,
          (index) => DataRow2(
            onTap: () {
              context.goNamed(
                RoutingPath.editGroupMatchScore,
                pathParameters: {
                  'groupId': groupId.toString(),
                  'matchType': type.name,
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
              for (var player in players) ...[
                DataCell(
                  Center(
                    child: Text(
                        '${totalPointsPerUser[player.id]?[index] != null ? totalPointsPerUser[player.id]![index] : ''}'),
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
