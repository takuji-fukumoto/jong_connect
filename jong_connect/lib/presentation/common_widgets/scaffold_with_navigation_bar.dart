import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          NavigationDestination(
              icon: Icon(Icons.account_circle_sharp), label: 'マイページ'),
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
