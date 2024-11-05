import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/usecase/user_auth_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../../util/constants.dart';
import '../../../util/routing_path.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('マイページ'),
      ),
      body: ListView(
        padding: paddingV8H8,
        children: [
          ListTile(
            leading: const Icon(Icons.account_tree),
            title: const Text('ゲーム設定'),
            onTap: () => context.goNamed(RoutingPath.gameConfig),
          ),
          ListTile(
            leading: const Icon(Icons.portrait_rounded),
            title: const Text('プロフィール'),
            onTap: () => context.goNamed(RoutingPath.editProfile),
          ),
          ListTile(
            leading: const Icon(Icons.groups),
            title: const Text('フレンド'),
            onTap: () => context.goNamed(RoutingPath.friends),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('ログアウト'),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                  context: context, message: 'ログアウトしますか？');

              if (result.name != 'ok') {
                return;
              }

              ref.read(userAuthUseCaseProvider).signOut();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.delete_forever,
              color: Theme.of(context).colorScheme.errorContainer,
            ),
            title: Text(
              'アカウント削除',
              style: TextStyle(
                color: Theme.of(context).colorScheme.errorContainer,
              ),
            ),
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                message: 'アカウント削除すると今までの対局履歴や成績が全て閲覧できなくなります。\nアカウントを削除しますか？',
                okLabel: '削除',
                isDestructiveAction: true,
              );

              if (result.name != 'ok') {
                return;
              }

              final confirm = await showOkCancelAlertDialog(
                context: context,
                message: '本当にアカウントを削除しますか？',
                okLabel: '削除',
                isDestructiveAction: true,
              );

              if (confirm.name != 'ok') {
                return;
              }

              await ref.read(userAuthUseCaseProvider).deactivate();
              SnackBarService.showSnackBar(content: 'アカウントを削除しました');
            },
          ),
        ],
      ),
    );
  }
}
