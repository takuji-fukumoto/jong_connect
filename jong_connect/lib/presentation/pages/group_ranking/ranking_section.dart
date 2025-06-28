import 'package:async_value_group/async_value_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/group_details.dart';
import 'package:jong_connect/domain/provider/group_season_ranking.dart';
import 'package:jong_connect/domain/provider/group_total_ranking.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../../domain/model/app_user.dart';
import '../../../util/constants.dart';

class RankingSection extends ConsumerStatefulWidget {
  const RankingSection(
      {super.key, required this.groupId, required this.seasonId});

  final int groupId;
  final int? seasonId;

  @override
  ConsumerState<RankingSection> createState() => _RankingSectionState();
}

class _RankingSectionState extends ConsumerState<RankingSection> {
  Set<MatchType> selectedType = {MatchType.four};
  Set<GroupRankingCategory> selectedCategory = {
    GroupRankingCategory.totalPoints
  };

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
                onSelectionChanged: _onTypeChanged,
                showSelectedIcon: false,
                segments: [
                  for (var type in MatchType.values)
                    ButtonSegment(value: type, label: Text(type.displayName)),
                ],
                selected: selectedType,
              ),
            ),
            gapH8,
            SizedBox(
              width: deviceSize.width / 1.5,
              child: SegmentedButton(
                onSelectionChanged: _onCategoryChanged,
                showSelectedIcon: false,
                segments: [
                  for (var type in GroupRankingCategory.values)
                    ButtonSegment(value: type, label: Text(type.displayName)),
                ],
                selected: selectedCategory,
              ),
            ),
            gapH16,
            _RecordBody(
              groupId: widget.groupId,
              seasonId: widget.seasonId,
              type: selectedType.first,
              category: selectedCategory.first,
            ),
          ],
        ),
      ),
    );
  }

  void _onTypeChanged(Set<MatchType> set) {
    setState(() {
      selectedType = set;
    });
  }

  void _onCategoryChanged(Set<GroupRankingCategory> set) {
    setState(() {
      selectedCategory = set;
    });
  }
}

class _RecordBody extends ConsumerWidget {
  const _RecordBody(
      {required this.groupId,
      required this.seasonId,
      required this.type,
      required this.category});

  final int groupId;
  final int? seasonId;
  final MatchType type;
  final GroupRankingCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncValue = seasonId != null
        ? ref.watch(groupSeasonRankingProvider(
            groupId: groupId, seasonId: seasonId!, matchType: type))
        : ref.watch(
            groupTotalRankingProvider(groupId: groupId, matchType: type));

    return AsyncValueGroup.group2(
      asyncValue,
      ref.watch(groupDetailsProvider(groupId: groupId)),
    ).when(
      data: (values) {
        var targetRanking = values.$1.rankingFromCategory(category);
        var groupUsers = values.$2.joinedUsers
            .where((e) => e.user != null)
            .map((e) => e.user!)
            .toList();
        return Column(
          children: [
            for (var rankingItem in targetRanking) ...{
              RankingListItem(
                user: groupUsers
                    .firstWhere((user) => user.id == rankingItem.userId),
                rank: rankingItem.rank,
                score: rankingItem.score,
              )
            }
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

class RankingListItem extends StatelessWidget {
  const RankingListItem(
      {super.key, required this.user, required this.rank, required this.score});

  final AppUser user;
  final int rank;
  final String score;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(rank.toString()),
      title: Text(user.name),
      trailing: Text(score),
    );
  }
}
