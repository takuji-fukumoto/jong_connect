import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jong_connect/domain/model/group_round_match_result.dart';
import 'package:jong_connect/domain/provider/recently_match_results.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/app_icon_urls.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/format_date.dart';

class RecentlyMatchResultsSection extends ConsumerWidget {
  const RecentlyMatchResultsSection({super.key});

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
    final deviceSize = MediaQuery.of(context).size;
    return AsyncValueWidget(
      asyncValue: ref.watch(recentlyMatchResultsProvider(limit: maxDispCount)),
      data: (roundResults) {
        return SizedBox(
          height: deviceSize.height / 3.0,
          child: ListView(
            children: [
              if (roundResults.isEmpty) ...[
                const Center(
                  child: Text('対局結果がありません'),
                ),
              ] else ...[
                for (var roundResult in roundResults) ...{
                  _ResultListTile(
                    roundResult: roundResult,
                  ),
                },
              ],
            ],
          ),
        );
      },
    );
  }
}

class _ResultListTile extends StatelessWidget {
  const _ResultListTile({super.key, required this.roundResult});

  final GroupRoundMatchResult roundResult;

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormatter(roundResult.results.first.createdAt);
    return Padding(
      padding: paddingV8H8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateFormatter.formatToYYYYMMDDHHmm(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          gapH4,
          StaggeredGrid.count(
            axisDirection: AxisDirection.down,
            crossAxisCount: 2,
            mainAxisSpacing: Sizes.p8,
            crossAxisSpacing: Sizes.p8,
            children: [
              for (var result in roundResult.resultsOrderByRank) ...[
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 0.5,
                  child: Container(
                    padding: paddingV8H8,
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (result.rank == 1)
                                Expanded(
                                  child: CachedNetworkImage(
                                      width: Sizes.p16,
                                      height: Sizes.p16,
                                      imageUrl: AppIconUrls.crown),
                                )
                              else
                                const Expanded(child: SizedBox()),
                              Text(
                                result.rank.toString(),
                                style: const TextStyle(
                                  fontSize: Sizes.p24,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            child: CachedNetworkImage(
                                imageUrl: result.user!.avatarUrl),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                result.user!.name,
                                minFontSize: Sizes.p8,
                                overflow: TextOverflow.ellipsis,
                              ),
                              gapH8,
                              AutoSizeText(
                                result.score.toString(),
                                minFontSize: Sizes.p8,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            result.totalPoints.toString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: result.totalPoints > 0
                                  ? Colors.blueAccent
                                  : result.totalPoints < 0
                                      ? Colors.redAccent
                                      : Theme.of(context)
                                          .colorScheme
                                          .inverseSurface,
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
        ],
      ),
    );
  }
}
