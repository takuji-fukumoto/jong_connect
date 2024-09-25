import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/presentation/common_widgets/user_list_tile.dart';
import 'package:jong_connect/util/app_sizes.dart';

class FriendsPage extends ConsumerWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('ともだちリスト'),
      ),
      body: AsyncValueWidget(
        asyncValue: ref.watch(currentFriendsProvider),
        data: (friends) {
          return ListView(
            padding: paddingV8H8,
            children: [
              gapH16,
              if (friends.isEmpty) ...[
                const Center(
                  child: Text('ともだちを追加して対局結果を記録しましょう！'),
                ),
              ] else ...[
                for (var friend in friends)
                  UserListTile(
                    user: friend,
                    isFriend: true, // MEMO: ともだちリストなので固定でtrue
                  ),
              ],
            ],
          );
        },
      ),
    );
  }
}
