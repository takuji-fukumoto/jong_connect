import 'dart:collection';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/model/app_user.dart';
import 'package:jong_connect/domain/model/group_match.dart';
import 'package:jong_connect/util/app_sizes.dart';
import '../../../util/routing_path.dart';
import '../../util/format_date.dart';
import '../../util/score_color.dart';

class GroupMatchResultSummary extends StatelessWidget {
  const GroupMatchResultSummary({super.key, required this.match});

  final GroupMatch match;

  @override
  Widget build(BuildContext context) {
    if (match.results!.isEmpty) {
      return const SizedBox();
    }

    final size = MediaQuery.of(context).size;
    final startAt = DateFormatter(match.createdAt).formatToYYYYMMDDHHmm();
    final endAt = match.endAt != null
        ? DateFormatter(match.endAt!).formatToYYYYMMDDHHmm()
        : "";

    return GestureDetector(
      onTap: () => {
        context.goNamed(
          RoutingPath.groupMatch,
          pathParameters: {
            'groupId': match.groupId.toString(),
            'groupMatchId': match.id.toString(),
          },
        )
      },
      child: Container(
        height: size.height * 0.25,
        padding: paddingV8H8,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: AutoSizeText(
                      match.group!.name,
                      style: TextStyle(
                        fontSize: Sizes.p20,
                        fontWeight: FontWeight.w200,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: AutoSizeText(
                      match.season?.name ?? "",
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            gapH4,
            Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    match.isFinish ? "$startAt – $endAt" : startAt,
                    minFontSize: Sizes.p8,
                    maxLines: 1,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            gapH8,
            Expanded(
              child: _GroupMatchResultListView(match: match),
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupMatchResultListView extends StatelessWidget {
  const _GroupMatchResultListView({super.key, required this.match});

  final GroupMatch match;
  final int rowCount = 2;

  @override
  Widget build(BuildContext context) {
    var totalResults = match.totalPointsPerUser;
    var sortedResults = SplayTreeMap<String, int>.from(
        totalResults, (a, b) => totalResults[b]!.compareTo(totalResults[a]!));
    var playerIds = sortedResults.keys.toList();
    var playerMap = Map.fromIterables(
        match.joinUsers.map<String>((user) => user.id).toList(),
        match.joinUsers.map<AppUser>((user) => user).toList());

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var playerId in playerIds)
            _UserScoreListItem(
              user: playerMap[playerId]!,
              score: sortedResults[playerId]!,
            ),
        ],
      ),
    );
  }
}

class _UserScoreListItem extends StatelessWidget {
  const _UserScoreListItem(
      {super.key, required this.user, required this.score});

  final AppUser user;
  final int score;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: user.avatarUrl,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 40,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          gapH4,
          AutoSizeText(
            user.name,
            style: Theme.of(context).textTheme.bodySmall,
            minFontSize: Sizes.p8,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          gapH4,
          Text(
            score.toString(),
            style: TextStyle(
              fontSize: 16,
              color: scoreColor(context, score),
            ),
          ),
        ],
      ),
    );
  }
}
