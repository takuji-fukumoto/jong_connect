import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/current_friends.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/util/app_sizes.dart';

class FriendsListSection extends ConsumerWidget {
  const FriendsListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
        asyncValue: ref.watch(currentFriendsProvider),
        data: (friends) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('ともだち一覧'),
              gapH16,
              if (friends.isEmpty) ...[
                const Text('ともだちがいません'),
              ] else ...[
                for (final friend in friends)
                  Text('${friend.name} ${friend.hashedFriendId}'),
              ],
            ],
          );
        });
  }
}
