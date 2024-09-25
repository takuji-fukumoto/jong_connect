import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/presentation/common_widgets/user_list_tile.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/routing_path.dart';

class FriendsListSection extends ConsumerWidget {
  const FriendsListSection({super.key});

  final int maxDispCount = 10; // 最大表示件数

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(currentFriendsProvider),
      data: (friends) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _TitleSection(),
            gapH16,
            if (friends.isEmpty) ...[
              const Text('ともだちがいません'),
            ] else ...[
              for (int i = 0; i < friends.length && i < maxDispCount; i++) ...{
                UserListTile(
                  user: friends[i],
                  isFriend: true, // MEMO: ともだちリストなので固定でtrue
                ),
              }
            ],
          ],
        );
      },
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'ともだちリスト',
          style: TextStyle(fontSize: Sizes.p16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => context.goNamed(RoutingPath.inviteFriend),
              icon: const Icon(Icons.group_add),
            ),
            gapW8,
            TextButton(
              onPressed: () => {context.goNamed(RoutingPath.friends)},
              child: const Text('全て見る'),
            ),
          ],
        ),
      ],
    );
  }
}
