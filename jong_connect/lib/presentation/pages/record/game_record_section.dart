import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jong_connect/domain/provider/game_record.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../domain/model/app_user.dart';
import '../../../domain/model/game_record.dart';
import '../../../domain/model/group.dart';
import '../../../util/constants.dart';

class GameRecordSection extends ConsumerStatefulWidget {
  const GameRecordSection(
      {super.key, required this.user, required this.filterGroups});

  final AppUser user;
  final List<Group> filterGroups;

  @override
  ConsumerState<GameRecordSection> createState() => _GameRecordSectionState();
}

class _GameRecordSectionState extends ConsumerState<GameRecordSection> {
  Set<MatchType> selected = {MatchType.four};
  int? filterValue;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: paddingV12H12,
        child: Column(
          children: [
            SizedBox(
              width: deviceSize.width / 2,
              child: SegmentedButton(
                onSelectionChanged: _onSelectionChanged,
                showSelectedIcon: false,
                segments: [
                  for (var type in MatchType.values)
                    ButtonSegment(value: type, label: Text(type.displayName)),
                ],
                selected: selected,
              ),
            ),
            gapH16,
            const Row(
              children: [
                gapW12,
                Text(
                  '集計対象',
                  style: TextStyle(
                    fontSize: Sizes.p12,
                  ),
                ),
              ],
            ),
            gapH4,
            DropdownButtonHideUnderline(
              child: DropdownButton2<int?>(
                isExpanded: true,
                value: filterValue,
                items: [
                  const DropdownMenuItem(
                    value: null,
                    child: Text('全て'),
                  ),
                  for (var group in widget.filterGroups)
                    DropdownMenuItem(
                      value: group.id,
                      child: Text(
                        group.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
                onChanged: (value) {
                  setState(() {
                    filterValue = value != -1 ? value : null;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 40,
                  padding:
                      const EdgeInsets.only(left: Sizes.p8, right: Sizes.p8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                  ),
                  elevation: 0,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: WidgetStateProperty.all(6),
                    thumbVisibility: WidgetStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: Sizes.p16, right: Sizes.p8),
                ),
              ),
            ),
            gapH16,
            _RecordBody(
              user: widget.user,
              type: selected.first,
              filterGroupId: filterValue,
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectionChanged(Set<MatchType> set) {
    setState(() {
      selected = set;
    });
  }
}

class _RecordBody extends ConsumerWidget {
  const _RecordBody(
      {super.key,
      required this.user,
      required this.type,
      required this.filterGroupId});

  final AppUser user;
  final MatchType type;
  final int? filterGroupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(gameRecordProvider(
          userId: user.id, matchTypeName: type.name, groupId: filterGroupId)),
      data: (record) {
        return StaggeredGrid.count(
          axisDirection: AxisDirection.down,
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: _RecordBase(record: record),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: _RankCountsPieChart(counts: record.rankCounts),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: _Recent20RankLineChart(
                  recent20Ranks: record.recent20Ranks, type: type),
            ),
          ],
        );
      },
    );
  }
}

class _RecordBase extends StatelessWidget {
  const _RecordBase({super.key, required this.record});

  final GameRecord record;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _RecordBaseRow(
          label: '対戦回数',
          text: record.totalGamesString,
        ),
        gapH4,
        _RecordBaseRow(
          label: '平均順位',
          text: record.averageRankString,
        ),
        gapH4,
        _RecordBaseRow(
          label: '連対率',
          text: record.topTwoRateString,
        ),
        gapH4,
        _RecordBaseRow(
          label: '飛び率',
          text: record.bustingRateString,
        ),
        gapH4,
        _RecordBaseRow(
          label: '累計ポイント',
          text: record.totalPoints.toString(),
        ),
        gapH4,
        _RecordBaseRow(
          label: '平均ポイント',
          text: record.averagePointsString,
        ),
      ],
    );
  }
}

class _RecordBaseRow extends StatelessWidget {
  const _RecordBaseRow({super.key, required this.label, required this.text});

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          label,
          minFontSize: Sizes.p8,
          maxFontSize: Sizes.p16,
        ),
        AutoSizeText(
          text,
          minFontSize: Sizes.p8,
          maxFontSize: Sizes.p16,
        ),
      ],
    );
  }
}

class _Recent20RankLineChart extends StatelessWidget {
  const _Recent20RankLineChart(
      {super.key, required this.recent20Ranks, required this.type});

  final List<int> recent20Ranks;
  final MatchType type;

  @override
  Widget build(BuildContext context) {
    var reversedRanks = recent20Ranks.reversed.toList();

    return Column(
      children: [
        const Text('最近の対局順位'),
        gapH8,
        Expanded(
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                horizontalInterval: 1,
                verticalInterval: 1,
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    strokeWidth: 0.5,
                  );
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                leftTitles: AxisTitles(
                  axisNameWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = type.playableNumber; i > 0; i--)
                        Transform.rotate(
                          angle: 90 * pi / 180,
                          child: Text(
                            i.toString(),
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                  axisNameSize: 12,
                ),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                    color: Theme.of(context).colorScheme.inverseSurface),
              ),
              minX: 0,
              maxX: 20,
              minY: type.playableNumber.toDouble(),
              maxY: 1,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    for (var i = 0; i < reversedRanks.length; i++)
                      FlSpot(i.toDouble(), reversedRanks[i].toDouble()),
                  ],
                  barWidth: 1.5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RankCountsPieChart extends StatelessWidget {
  const _RankCountsPieChart({super.key, required this.counts});

  final List<int> counts;
  static const List<Color> rankColors = [
    Colors.lightGreen,
    Colors.blueAccent,
    Colors.blueGrey,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final totalCounts = counts.reduce((a, b) => a + b);
    return PieChart(
      PieChartData(
        borderData: FlBorderData(
          show: true,
        ),
        startDegreeOffset: -90,
        sectionsSpace: 3,
        centerSpaceRadius: 50,
        sections: [
          for (var i = 0; i < counts.length; i++)
            PieChartSectionData(
              value: counts[i].toDouble(),
              color: rankColors[i],
              showTitle: true,
              title:
                  '${i + 1}着(${counts[i]}回)\n${((counts[i] / totalCounts) * 100).toStringAsFixed(2)}%',
              titleStyle: const TextStyle(
                fontSize: Sizes.p12,
              ),
            ),
        ],
      ),
    );
  }
}
