import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/routing_path.dart';

import '../../../domain/model/app_user.dart';
import '../../../util/constants.dart';
import '../../common_widgets/user_profile_dialog.dart';

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
                _FriendListTile(friend: friends[i]),
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
        const Text('ともだち一覧'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => context.goNamed(RoutingPath.inviteFriend),
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

class _FriendListTile extends StatelessWidget {
  const _FriendListTile({super.key, required this.friend});

  final AppUser friend;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 40,
        height: 40,
        child: CachedNetworkImage(
          imageUrl: friend.avatarUrl,
          imageBuilder: (context, imageProvider) => CircleAvatar(
            radius: 40,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => unknownUserIcon,
        ),
      ),
      title: Text(friend.name),
      subtitle: Text(friend.profile),
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) => UserProfileDialog(user: friend, isFriend: true),
        );
      },
    );
  }
}
