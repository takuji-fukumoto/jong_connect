import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

import 'new_friend_request_badge_widget.dart';

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
        destinations: [
          const NavigationDestination(
              icon: Icon(Icons.home_filled), label: 'ホーム'),
          const NavigationDestination(
              icon: Icon(Icons.meeting_room), label: 'ルーム'),
          const NavigationDestination(icon: Icon(Icons.analytics), label: '成績'),
          NewFriendRequestBadgeWidget(
            position: badges.BadgePosition.topEnd(top: 8, end: 24),
            child: const NavigationDestination(
                icon: Icon(Icons.account_circle_sharp), label: 'マイページ'),
          ),
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
