import 'dart:collection';

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
                Text(
                  match.group!.name,
                  style: const TextStyle(
                    fontSize: Sizes.p20,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(match.season?.name ?? ""),
              ],
            ),
            gapH4,
            Row(
              children: [
                Text(startAt),
                if (match.isFinish) ...[
                  gapW8,
                  const Text("-"),
                  gapW8,
                  Text(endAt),
                ]
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
          Text(user.name),
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
