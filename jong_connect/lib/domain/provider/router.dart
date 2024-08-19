import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:go_router/go_router.dart';

import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/sign_in/sign_in_page.dart';
import 'auth_state.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      GoRoute(
        path: '/sign_in',
        builder: (context, state) => const SignInPage(),
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
    redirect: (BuildContext context, GoRouterState state) {
      print('リダイレクト発生。fullPath: ${state.fullPath}');
      final session = ref.read(authStateNotifier).authState?.session;
      print('session user id: ${session?.user.id}');
      if (session == null) {
        return state.fullPath == '/sign_in' ? null : '/sign_in';
      }

      // セッションが存在する & ログインページにいる場合はホームに遷移
      return state.fullPath == '/sign_in' ? '/' : null;
    },
    refreshListenable: ref.watch(authStateNotifier),
  ),
);
