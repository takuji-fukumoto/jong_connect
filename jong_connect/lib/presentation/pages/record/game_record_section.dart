import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jong_connect/domain/provider/game_record.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../../domain/model/app_user.dart';
import '../../../domain/model/game_record.dart';
import '../../../util/constants.dart';

class GameRecordSection extends ConsumerStatefulWidget {
  const GameRecordSection({super.key, required this.user});

  final AppUser user;

  @override
  ConsumerState<GameRecordSection> createState() => _GameRecordSectionState();
}

class _GameRecordSectionState extends ConsumerState<GameRecordSection> {
  Set<MatchType> selected = {MatchType.four};

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Padding(
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
          Expanded(
            child: _RecordBody(user: widget.user, type: selected.first),
          ),
        ],
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
  const _RecordBody({super.key, required this.user, required this.type});

  final AppUser user;
  final MatchType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref
          .watch(gameRecordProvider(userId: user.id, matchTypeName: type.name)),
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
              child: _RankCounts(counts: record.rankCounts),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: _Recent20RankCharts(recent20Ranks: record.recent20Ranks),
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _RecordBaseRow(
          label: '対戦回数',
          text: record.totalGamesString,
        ),
        gapH8,
        _RecordBaseRow(
          label: '平均順位',
          text: record.averageRankString,
        ),
        gapH8,
        _RecordBaseRow(
          label: '連対率',
          text: record.topTwoRateString,
        ),
        gapH8,
        _RecordBaseRow(
          label: '累計ポイント',
          text: record.totalPoints.toString(),
        ),
        gapH8,
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
        Text(label),
        Text(text),
      ],
    );
  }
}

class _Recent20RankCharts extends StatelessWidget {
  const _Recent20RankCharts({super.key, required this.recent20Ranks});

  final List<int> recent20Ranks;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _RankCounts extends StatelessWidget {
  const _RankCounts({super.key, required this.counts});

  final List<int> counts;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
