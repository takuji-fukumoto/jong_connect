import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:go_router/go_router.dart';
import 'package:jong_connect/domain/provider/user_session.dart';

import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/login_page.dart';
import 'auth.dart';

final routerProvider = Provider(
      (ref) => GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
          GoRoute(
            path: '/login',
            name: 'login',
            builder: (context, state) => const LoginPage(),
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

          final session = ref.read(userSessionProvider);
          print('session user id: ${session?.user.id}');
          if (session == null) {
            return state.fullPath == '/login' ? null : '/login';
          }

          return null;
        },
        refreshListenable: authStateNotifier,
      ),
);