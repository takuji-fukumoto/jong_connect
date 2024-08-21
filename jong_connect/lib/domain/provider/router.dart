import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:jong_connect/presentation/pages/record/record_page.dart';
import 'package:jong_connect/presentation/pages/rooms/rooms_page.dart';
import 'package:jong_connect/presentation/pages/settings/settings_page.dart';
import 'package:jong_connect/presentation/pages/sign_up/sign_up_page.dart';
import 'package:jong_connect/util/routing_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:go_router/go_router.dart';

import '../../presentation/common_widgets/scaffold_with_navigation_bar.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/sign_in/sign_in_page.dart';
import 'auth_state.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _sectionNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'section');

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutingPath.home,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavbar(navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: [
              GoRoute(
                path: RoutingPath.home,
                builder: (context, state) => const HomePage(),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutingPath.rooms,
                builder: (context, state) => const RoomsPage(),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutingPath.record,
                builder: (context, state) => const RecordPage(),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutingPath.settings,
                builder: (context, state) => const SettingsPage(),
                routes: [
                  GoRoute(
                    path: 'edit_profile',
                    builder: (context, state) {
                      return const EditProfilePage();
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: RoutingPath.signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: RoutingPath.signUp,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: RoutingPath.editProfile,
        builder: (context, state) => const EditProfilePage(),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
    redirect: (BuildContext context, GoRouterState state) async {
      print('リダイレクト発生。fullPath: ${state.fullPath}');
      final session = ref.read(authStateNotifier).authState?.session;
      print('session user id: ${session?.user.id}');

      if (session == null) {
        return state.fullPath == RoutingPath.signIn ||
                state.fullPath == RoutingPath.signUp
            ? null
            : RoutingPath.signIn;
      }
      // フレンドIDが設定されていない場合はユーザー設定画面へリダイレクト
      final user = await ref.read(currentUserProvider.future);
      if (user?.friendId == null) {
        return RoutingPath.editProfile;
      }

      // セッションが存在する & ログインページにいる場合はホームに遷移
      return state.fullPath == RoutingPath.signIn ? RoutingPath.home : null;
    },
    refreshListenable: ref.watch(authStateNotifier),
  ),
);
