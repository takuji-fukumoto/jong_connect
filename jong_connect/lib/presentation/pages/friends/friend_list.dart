import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/presentation/common_widgets/user_list_tile.dart';
import 'package:jong_connect/util/app_sizes.dart';

class FriendList extends ConsumerWidget {
  const FriendList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(currentFriendsProvider),
      data: (friends) {
        if (friends.isEmpty) {
          return const Center(
            child: Text('ともだちを追加して対局結果を記録しましょう！'),
          );
        }

        return ListView(
          padding: paddingV8H8,
          children: [
            for (var friend in friends)
              UserListTile(
                user: friend,
                isFriend: true, // MEMO: ともだちリストなので固定でtrue
              ),
          ],
        );
      },
    );
  }
}
