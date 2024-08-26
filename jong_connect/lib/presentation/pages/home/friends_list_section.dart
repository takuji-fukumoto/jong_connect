import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/routing_path.dart';

class FriendsListSection extends ConsumerWidget {
  const FriendsListSection({super.key, this.fullPath});

  final String? fullPath;
  final int maxDispCount = 10; // 最大表示件数

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(currentFriendsProvider),
      data: (friends) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TitleSection(fullPath: fullPath),
            gapH16,
            if (friends.isEmpty) ...[
              const Text('ともだちがいません'),
            ] else ...[
              for (int i = 0; i < friends.length && i < maxDispCount; i++) ...{
                Text('${friends[i].name} ${friends[i].hashedFriendId}'),
              }
            ],
          ],
        );
      },
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection({super.key, this.fullPath});

  final String? fullPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('ともだち一覧'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () =>
                  context.go('$fullPath/${RoutingPath.inviteFriend}'),
              icon: const Icon(Icons.group_add),
            ),
            gapW8,
            TextButton(
              onPressed: () => {},
              child: const Text('もっと見る'),
            ),
          ],
        ),
      ],
    );
  }
}
