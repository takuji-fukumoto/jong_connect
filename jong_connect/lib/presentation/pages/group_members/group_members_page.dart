import 'package:async_value_group/async_value_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/group_details.dart';
import 'package:jong_connect/presentation/common_widgets/user_list_tile.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../domain/provider/current_friends.dart';

class GroupMembersPage extends ConsumerWidget {
  const GroupMembersPage({super.key, required this.groupId});

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('参加メンバー'),
      ),
      body: AsyncValueGroup.group2(
        ref.watch(groupDetailsProvider(groupId: groupId)),
        ref.watch(currentFriendsProvider),
      ).when(
        data: (values) => Padding(
          padding: paddingV8H8,
          child: ListView(
            children: [
              for (var value in values.$1.joinedUsers!)
                UserListTile(
                  user: value.user!,
                  isFriend: values.$2.contains(value.user),
                ),
            ],
          ),
        ),
        error: (error, st) =>
            const Center(child: Text('Oops, something unexpected happened')),
        loading: () => Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.grey,
            size: 50,
          ),
        ),
      ),
    );
  }
}
