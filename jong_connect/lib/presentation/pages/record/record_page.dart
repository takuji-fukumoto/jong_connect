import 'package:async_value_group/async_value_group.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/domain/provider/joined_groups.dart';
import 'package:jong_connect/presentation/common_widgets/user_section_item_vertical.dart';
import 'package:jong_connect/presentation/pages/record/game_record_section.dart';

import '../../../domain/provider/current_friends.dart';

class RecordPage extends ConsumerWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('成績'),
      ),
      body: AsyncValueGroup.group3(
        ref.watch(currentUserProvider),
        ref.watch(currentFriendsProvider),
        ref.watch(joinedGroupsProvider),
      ).when(
        data: (values) {
          return DefaultTabController(
            length: values.$2.length + 1,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainerHighest,
                  height: 60,
                  unselectedBackgroundColor: Colors.transparent,
                  tabs: [
                    Tab(icon: UserSectionItemVertical(user: values.$1!)),
                    for (var friend in values.$2) ...[
                      Tab(icon: UserSectionItemVertical(user: friend)),
                    ],
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      GameRecordSection(
                        user: values.$1!,
                        filterGroups: values.$3,
                      ),
                      for (var friend in values.$2) ...[
                        GameRecordSection(
                          user: friend,
                          filterGroups: values.$3,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, st) {
          print(st);
          return const Center(
              child: Text('Oops, something unexpected happened'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
