import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:async_value_group/async_value_group.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/group_match.dart';
import 'package:jong_connect/domain/provider/group_match_players.dart';
import 'package:jong_connect/usecase/group_match_results_use_case.dart';
import 'package:jong_connect/util/constants.dart';

import '../../../domain/model/app_user.dart';
import '../../../domain/model/group_match.dart';
import '../../../util/app_icon_urls.dart';
import '../../../util/format_date.dart';
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
        final dateFormatter = DateFormatter(values.$2.createdAt);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.surface,
            title: Text('${dateFormatter.formatToMMDD()}の対局'),
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
                  child: Text(
                    '対局終了',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              IconButton(
                onPressed: () async {
                  final result = await showOkCancelAlertDialog(
                      context: context,
                      message: 'グループ対局を削除しますか？\n記録した各対局結果も全て削除されます');

                  if (result.name != 'ok') {
                    return;
                  }

                  ref
                      .read(groupMatchResultsUseCaseProvider)
                      .deleteMatch(values.$2);
                  context.pop();
                  SnackBarService.showSnackBar(content: 'グループ対局を削除しました');
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).colorScheme.error,
                ),
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
        return const Center(child: Text(unexpectedErrorMessage));
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
    final resultsPerRounds = groupMatch.resultsPerRound;

    Color scoreColor(int score) {
      return score > 0
          ? Colors.blue
          : score < 0
              ? Colors.redAccent
              : Theme.of(context).colorScheme.inverseSurface;
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
        columnSpacing: 0,
        horizontalMargin: 0,
        empty: const Center(
          child: Text('右下の追加ボタンから対局結果を追加できます'),
        ),
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

          /// 記録に残っているユーザーのみ表示する（退会済みのユーザーは除く）
          /// 何も記録がない場合見栄えが悪いのでユーザー全員表示
          for (var player in groupMatch.joinUsers.isEmpty
              ? players
              : groupMatch.joinUsers) ...[
            DataColumn2(
              label: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      player.name,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      totalPointsPerUser.keys.contains(player.id)
                          ? totalPointsPerUser[player.id].toString()
                          : 0.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: scoreColor(totalPointsPerUser[player.id] ?? 0),
                      ),
                    ),
                  ],
                ),
              ),
              size: ColumnSize.S,
              numeric: true,
            ),
          ],
        ],
        rows: List<DataRow>.generate(
          groupMatch.roundsCount,
          (index) => DataRow2(
            onTap: () {
              var targetUser = resultsPerRounds.keys
                  .firstWhere((user) => resultsPerRounds[user]?[index] != null);
              var matchOrder = resultsPerRounds[targetUser]![index]!.matchOrder;
              context.goNamed(
                RoutingPath.editGroupMatchScore,
                pathParameters: {
                  'groupId': groupId.toString(),
                  'groupMatchId': groupMatch.id.toString(),
                  'matchOrder': matchOrder.toString(),
                },
              );
            },
            cells: [
              DataCell(
                Center(
                  child: Text((index + 1).toString()),
                ),
              ),
              for (var player in groupMatch.joinUsers) ...[
                DataCell(
                  Center(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        if (resultsPerRounds[player.id]?[index] != null &&
                            resultsPerRounds[player.id]![index]!.rank == 1)
                          Positioned(
                            top: 5,
                            child: CachedNetworkImage(
                              imageUrl: AppIconUrls.crown,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Center(
                          child: Text(
                            '${resultsPerRounds[player.id]?[index] != null ? resultsPerRounds[player.id]![index]!.totalPoints : ''}',
                            style: TextStyle(
                              fontSize: 16,
                              color: scoreColor(resultsPerRounds[player.id]
                                          ?[index]
                                      ?.totalPoints ??
                                  0),
                            ),
                          ),
                        ),
                      ],
                    ),
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
