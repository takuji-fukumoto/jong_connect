import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/recently_match_results.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../common_widgets/group_match_result_summary.dart';

class RecentlyGroupMatchesSection extends ConsumerWidget {
  const RecentlyGroupMatchesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TitleSection(),
        gapH8,
        _ResultsList(),
      ],
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '最近の対局',
      style: TextStyle(
        fontSize: Sizes.p24,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class _ResultsList extends ConsumerWidget {
  const _ResultsList({super.key});

  final int maxDispCount = 3; // 最大表示件数

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(recentlyMatchResultsProvider(limit: maxDispCount)),
      data: (groupMatches) {
        return Column(
          children: [
            if (groupMatches.isEmpty) ...[
              const Center(
                child: Text('直近の対局結果はありません'),
              ),
            ] else ...[
              for (var groupMatch in groupMatches) ...{
                GroupMatchResultSummary(
                  match: groupMatch,
                ),
                gapH8,
              },
            ],
          ],
        );
      },
    );
  }
}
