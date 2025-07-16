import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/group_details.dart';
import 'package:jong_connect/presentation/common_widgets/async_value_widget.dart';
import 'package:jong_connect/presentation/common_widgets/user_list_tile.dart';
import 'package:jong_connect/util/app_sizes.dart';

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
      body: AsyncValueWidget(
        asyncValue: ref.watch(groupDetailsProvider(groupId: groupId)),
        data: (group) {
          return Padding(
            padding: paddingV8H8,
            child: ListView(
              children: [
                for (var value in group.joinedUsers)
                  UserListTile(
                    user: value.user!,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
