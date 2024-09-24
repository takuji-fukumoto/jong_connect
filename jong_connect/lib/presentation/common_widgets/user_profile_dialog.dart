import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/usecase/friend_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';
import '../../domain/model/app_user.dart';
import '../../util/constants.dart';

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
        if (isFriend) _RemoveFriendButton(user: user),
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
