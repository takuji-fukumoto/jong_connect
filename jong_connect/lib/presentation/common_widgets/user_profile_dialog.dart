import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:async_value_group/async_value_group.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/is_requested_friend_user.dart';
import 'package:jong_connect/usecase/friend_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';
import '../../domain/model/app_user.dart';
import '../../domain/provider/current_user.dart';
import '../../util/constants.dart';
import '../../util/routing_path.dart';

class UserProfileDialog extends Dialog {
  const UserProfileDialog(
      {super.key, required this.user, required this.isFriend});

  final AppUser user;
  final bool isFriend;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: CachedNetworkImage(imageUrl: user.avatarUrl),
          ),
          gapH4,
          Text(
            user.name,
            style: const TextStyle(
              fontSize: Sizes.p24,
            ),
          ),
          gapH8,
          Text(
            user.profile,
            style: TextStyle(
              fontSize: Sizes.p16,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
      actions: [
        if (isFriend) ...[
          _ViewRecordButton(user: user),
          _RemoveFriendButton(user: user),
        ] else
          _RequestFriendButton(user: user),
      ],
    );
  }
}

class _RemoveFriendButton extends ConsumerWidget {
  const _RemoveFriendButton({super.key, required this.user});

  final AppUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        final result = await showOkCancelAlertDialog(
          context: context,
          message: 'ともだちを解除するとグループへの招待、成績の閲覧ができなくなります',
          okLabel: '解除',
          isDestructiveAction: true,
        );

        if (result.name != 'ok') {
          return;
        }

        await ref.read(friendUseCaseProvider).removeFriend(user);
        context.pop();
        SnackBarService.showSnackBar(content: 'ともだち解除しました');
      },
      child: const Text('ともだち解除'),
    );
  }
}

class _RequestFriendButton extends ConsumerWidget {
  const _RequestFriendButton({super.key, required this.user});

  final AppUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueGroup.group2(
      ref.watch(currentUserProvider),
      ref.watch(isRequestedFriendUserProvider(user.friendId)),
    ).when(
      data: (value) {
        // MEMO: 自分自身の場合はなにも表示しない
        if (value.$1!.id == user.id) {
          return const SizedBox();
        }

        if (value.$2) {
          return ElevatedButton(
            onPressed: () {},
            child: const Text('フレンド申請済み'),
          );
        }
        return ElevatedButton(
          onPressed: () async {
            try {
              await ref.read(friendUseCaseProvider).sendFriendRequest(user);
              context.pop();
              SnackBarService.showSnackBar(content: 'フレンド申請しました');
            } catch (e) {
              SnackBarService.showErrorSnackBar(
                  content: unexpectedErrorMessage);
            }
          },
          child: const Text('フレンド申請'),
        );
      },
      loading: () => ElevatedButton(
        onPressed: () {},
        child: const CircularProgressIndicator(),
      ),
      error: (error, st) => const Center(child: Text(unexpectedErrorMessage)),
    );
  }
}

class _ViewRecordButton extends StatelessWidget {
  const _ViewRecordButton({super.key, required this.user});

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        context.goNamed(RoutingPath.record, queryParameters: {
          QueryParameters.defaultFriendId: user.hashedFriendId,
        });
      },
      child: const Text('戦績'),
    );
  }
}
