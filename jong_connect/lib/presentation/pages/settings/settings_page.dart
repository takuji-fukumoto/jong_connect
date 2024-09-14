import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/usecase/user_auth_use_case.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../../util/routing_path.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('設定'),
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
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text('プロフィール'),
            onTap: () => context.goNamed(RoutingPath.editProfile),
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
        ],
      ),
    );
  }
}
