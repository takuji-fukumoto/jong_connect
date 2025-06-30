import 'package:async_value_group/async_value_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/group_details.dart';
import 'package:jong_connect/domain/provider/group_seasons.dart';
import 'package:jong_connect/presentation/pages/group_ranking/ranking_section.dart';
import 'package:jong_connect/presentation/pages/group_ranking/target_season_dropdown.dart';
import 'package:jong_connect/util/app_sizes.dart';

class GroupRankingPage extends ConsumerStatefulWidget {
  const GroupRankingPage({super.key, required this.groupId});

  final int groupId;

  @override
  ConsumerState<GroupRankingPage> createState() => _GroupRankingPageState();
}

class _GroupRankingPageState extends ConsumerState<GroupRankingPage> {
  int? selectedSeasonId;

  void onChangeSeasonId(int? seasonId) {
    setState(() {
      selectedSeasonId = seasonId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('ランキング'),
      ),
      body: AsyncValueGroup.group2(
        ref.watch(groupSeasonsProvider(groupId: widget.groupId)),
        ref.watch(groupDetailsProvider(groupId: widget.groupId)),
      ).when(
        data: (values) {
          return Column(
            children: [
              TargetSeasonDropdown(
                groupSeasons: values.$1,
                onChangeSeasonId: onChangeSeasonId,
              ),
              gapH4,
              Expanded(
                child: RankingSection(
                  groupId: widget.groupId,
                  seasonId: selectedSeasonId,
                ),
              ),
            ],
          );
        },
        error: (error, st) {
          print(st);
          return const Center(
              child: Text('Oops, something unexpected happened'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
