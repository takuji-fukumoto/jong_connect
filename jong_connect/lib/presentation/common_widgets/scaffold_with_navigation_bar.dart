import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;
import 'package:jong_connect/domain/provider/new_friend_request_subscription.dart';

import 'async_value_widget.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar(this.navigationShell, {super.key});

  /// ブランチ・ナビゲーターのナビゲーション・シェルとコンテナ。
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_filled), label: 'ホーム'),
          NavigationDestination(icon: Icon(Icons.meeting_room), label: 'ルーム'),
          NavigationDestination(icon: Icon(Icons.analytics), label: '成績'),
          _MyPageNavigationDestination(),
        ],
        onDestinationSelected: _onTap,
      ),
    );
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      // 既にアクティブ状態でタップされた時、ルートページに戻す
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class _MyPageNavigationDestination extends ConsumerWidget {
  const _MyPageNavigationDestination({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      asyncValue: ref.watch(newFriendRequestSubscriptionProvider),
      data: (newRequests) {
        return badges.Badge(
          position: badges.BadgePosition.topEnd(top: 8, end: 24),
          showBadge: newRequests.isNotEmpty,
          badgeContent: SizedBox(),
          child: const NavigationDestination(
              icon: Icon(Icons.account_circle_sharp), label: 'マイページ'),
        );
      },
      loadingWidget: const NavigationDestination(
          icon: Icon(Icons.account_circle_sharp), label: 'マイページ'),
    );
  }
}
