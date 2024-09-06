import 'dart:collection';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/model/group_match.dart';
import 'package:jong_connect/domain/provider/group_matches.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/app_colors.dart';

class GroupMatchHistoriesSection extends ConsumerWidget {
  const GroupMatchHistoriesSection({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(groupMatchesProvider(groupId: id)),
      data: (matches) {
        return ListView(
          children: [
            for (var match in matches) ...{
              _MatchHistoryItem(match: match),
            },
          ],
        );
      },
    );
  }
}

class _MatchHistoryItem extends StatelessWidget {
  const _MatchHistoryItem({required this.match});

  final GroupMatch match;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${match.createdBy?.name ?? '退会済みユーザー'}さんが対局結果を記録しました'),
      tileColor: AppColors.powderGreen,
      subtitle: _ResultView(match: match),
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

    return SizedBox(
      height: 150,
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
