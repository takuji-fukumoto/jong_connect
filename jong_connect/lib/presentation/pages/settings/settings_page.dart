import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../../util/routing_path.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          )
        ],
      ),
    );
  }
}
