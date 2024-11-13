import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/presentation/pages/friends/request_in_progress_list.dart';
import 'package:jong_connect/presentation/pages/friends/request_waiting_for_approval_list.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:jong_connect/util/routing_path.dart';

import '../../common_widgets/new_friend_request_badge_widget.dart';
import 'friend_list.dart';

class FriendsPage extends ConsumerWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          title: const Text('フレンド'),
          bottom: TabBar(
            indicatorPadding: const EdgeInsets.symmetric(
              horizontal: Sizes.p8,
              vertical: Sizes.p8,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: Sizes.p8,
            indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
            ),
            labelColor: Theme.of(context).colorScheme.inverseSurface,
            unselectedLabelColor: Theme.of(context).colorScheme.surface,
            tabs: [
              const Tab(child: Text('フレンド')),
              const Tab(child: Text('申請中')),
              NewFriendRequestBadgeWidget(
                position: BadgePosition.topEnd(top: 5, end: -20),
                child: const Tab(child: Text('承認')),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FriendList(),
            RequestInProgressList(),
            RequestWaitingForApprovalList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          onPressed: () => context.goNamed(RoutingPath.inviteFriend),
          child: const Icon(Icons.person_add),
        ),
      ),
    );
  }
}
