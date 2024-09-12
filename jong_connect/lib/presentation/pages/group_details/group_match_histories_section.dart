import 'dart:collection';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:async_value_group/async_value_group.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:jong_connect/domain/model/group_match.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/domain/provider/group_matches.dart';
import 'package:jong_connect/util/app_colors.dart';

import '../../../domain/model/app_user.dart';
import '../../../util/constants.dart';
import '../../../util/format_date.dart';
import '../../../util/routing_path.dart';

class GroupMatchHistoriesSection extends ConsumerWidget {
  const GroupMatchHistoriesSection({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mediaSize = MediaQuery.of(context).size;
    return AsyncValueGroup.group2(
      ref.watch(groupMatchesProvider(groupId: id)),
      ref.watch(currentUserProvider),
    ).when(
      data: (values) {
        return Stack(
          alignment: Alignment.center,
          children: [
            GroupedListView<GroupMatch, String>(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 64),
              elements: values.$1,
              reverse: true,
              order: GroupedListOrder.DESC,
              groupBy: (match) =>
                  DateFormatter(match.createdAt).formatToYYYYMMDD(),
              groupSeparatorBuilder: (String groupByValue) => _SeparatorBuilder(
                groupByValue: groupByValue,
              ),
              itemBuilder: (context, GroupMatch match) => _MatchHistoryItem(
                match: match,
                user: values.$2!,
              ),
              floatingHeader: true,
              physics: const BouncingScrollPhysics(),
            ),
            Positioned(
              bottom: 10,
              child: SizedBox(
                width: mediaSize.width - 20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.outerSpace,
                  ),
                  onPressed: () async {
                    final result = await showModalActionSheet<String>(
                      context: context,
                      message: '対局タイプを選択してください',
                      actions: [
                        for (var type in MatchType.values) ...[
                          SheetAction(
                            label: type.displayName,
                            key: type.name,
                          ),
                        ],
                      ],
                    );

                    if (result == null) {
                      return;
                    }
                    context.goNamed(
                      RoutingPath.groupMatch,
                      pathParameters: {
                        'groupId': id.toString(),
                        'matchType': result,
                      },
                    );
                  },
                  child: const Text(
                    '記録をつける',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
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

class _SeparatorBuilder extends StatelessWidget {
  final String groupByValue;

  const _SeparatorBuilder({required this.groupByValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
            child: _SeparateLine(),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              groupByValue,
              style: const TextStyle(color: AppColors.ardoise),
            ),
          ),
          const Expanded(
            child: _SeparateLine(),
          ),
        ],
      ),
    );
  }
}

class _SeparateLine extends StatelessWidget {
  const _SeparateLine();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black26,
              ),
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}

class _MatchHistoryItem extends StatelessWidget {
  const _MatchHistoryItem({required this.match, required this.user});

  final GroupMatch match;
  final AppUser user;

  @override
  Widget build(BuildContext context) {
    final isMine = match.createdBy?.id == user.id;
    return Column(
      children: [
        BubbleNormal(
          text: isMine
              ? '対局結果を記録しました'
              : '${match.createdBy?.name ?? '退会済みユーザー'}さんが対局結果を記録しました',
          isSender: isMine,
          color: AppColors.powderGreen,
          leading: CachedNetworkImage(
            imageUrl: match.createdBy?.avatarUrl ?? '',
            width: 30,
            height: 30,
          ),
          tail: false,
        ),
        _ResultView(match: match),
      ],
    );
  }
}

class _ResultView extends StatelessWidget {
  const _ResultView({required this.match});

  final GroupMatch match;
  final int rowCount = 2;

  @override
  Widget build(BuildContext context) {
    var totalResults = match.totalResultsPerUser;
    var sortedResults = SplayTreeMap<String, int>.from(
        totalResults!, (a, b) => totalResults[b]!.compareTo(totalResults[a]!));
    var userNames = sortedResults.keys.toList();

    return Container(
      height: 150,
      color: AppColors.powderGreen,
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        dataRowHeight: 30,
        headingRowHeight: 30,
        sortColumnIndex: 1,
        columns: const [
          DataColumn2(
            label: Text('参加ユーザー'),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text('最終スコア'),
            numeric: true,
          ),
        ],
        rows: List<DataRow>.generate(
          sortedResults.length,
          (index) => DataRow(
            cells: [
              DataCell(Text(userNames[index])),
              DataCell(Text(sortedResults[userNames[index]].toString())),
            ],
          ),
        ),
      ),
    );
  }
}
