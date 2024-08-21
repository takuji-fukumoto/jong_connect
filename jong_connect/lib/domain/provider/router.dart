import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/domain/provider/current_user.dart';
import 'package:jong_connect/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:jong_connect/presentation/pages/sign_up/sign_up_page.dart';
import 'package:jong_connect/util/routing_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:go_router/go_router.dart';

import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/sign_in/sign_in_page.dart';
import 'auth_state.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: RoutingPath.home,
    routes: [
      GoRoute(
        path: RoutingPath.home,
        builder: (context, state) =>
            const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      GoRoute(
        path: RoutingPath.signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: RoutingPath.signUp,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
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
