import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/presentation/pages/create_group/create_group_page.dart';
import 'package:jong_connect/presentation/pages/edit_group/edit_group_page.dart';
import 'package:jong_connect/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:jong_connect/presentation/pages/friends/friends_page.dart';
import 'package:jong_connect/presentation/pages/game_config/game_config_page.dart';
import 'package:jong_connect/presentation/pages/group_members/group_members_page.dart';
import 'package:jong_connect/presentation/pages/input_group_match_score/input_match_score_page.dart';
import 'package:jong_connect/presentation/pages/invite_friend/invite_friend_page.dart';
import 'package:jong_connect/presentation/pages/record/record_page.dart';
import 'package:jong_connect/presentation/pages/rooms/rooms_page.dart';
import 'package:jong_connect/presentation/pages/settings/settings_page.dart';
import 'package:jong_connect/presentation/pages/sign_up/sign_up_page.dart';
import 'package:jong_connect/util/routing_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:go_router/go_router.dart';

import '../../presentation/common_widgets/scaffold_with_navigation_bar.dart';
import '../../presentation/pages/edit_group_match_score/edit_match_score_page.dart';
import '../../presentation/pages/group_details/group_details_page.dart';
import '../../presentation/pages/group_match/group_match_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/sign_in/sign_in_page.dart';
import 'auth_state.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _roomsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rooms');
final _settingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'settings');
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
            initialLocation: RoutingPath.home,
            routes: [
              GoRoute(
                path: RoutingPath.home,
                builder: (context, state) => const HomePage(),
                routes: const [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _roomsNavigatorKey,
            routes: [
              GoRoute(
                path: RoutingPath.rooms,
                builder: (context, state) => const RoomsPage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    name: RoutingPath.createGroup,
                    path: RoutingPath.createGroup,
                    builder: (context, state) => const CreateGroupPage(),
                    routes: const [],
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    name: RoutingPath.groupDetails,
                    path: RoutingPath.groupDetails,
                    builder: (context, state) {
                      final groupId =
                          int.parse(state.pathParameters['groupId']!);

                      return GroupDetailsPage(
                        id: groupId,
                      );
                    },
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        name: RoutingPath.groupMatch,
                        path: RoutingPath.groupMatch,
                        builder: (context, state) {
                          final groupId =
                              int.parse(state.pathParameters['groupId']!);
                          final groupMatchId =
                              int.parse(state.pathParameters['groupMatchId']!);

                          return GroupMatchPage(
                            groupId: groupId,
                            groupMatchId: groupMatchId,
                          );
                        },
                        routes: [
                          GoRoute(
                            parentNavigatorKey: _rootNavigatorKey,
                            name: RoutingPath.inputGroupMatchScore,
                            path: RoutingPath.inputGroupMatchScore,
                            builder: (context, state) {
                              final groupId =
                                  int.parse(state.pathParameters['groupId']!);
                              final groupMatchId = int.parse(
                                  state.pathParameters['groupMatchId']!);

                              return InputGroupMatchScorePage(
                                groupId: groupId,
                                groupMatchId: groupMatchId,
                              );
                            },
                            routes: const [],
                          ),
                          GoRoute(
                            parentNavigatorKey: _rootNavigatorKey,
                            name: RoutingPath.editGroupMatchScore,
                            path: RoutingPath.editGroupMatchScore,
                            builder: (context, state) {
                              final groupId =
                                  int.parse(state.pathParameters['groupId']!);
                              final groupMatchId = int.parse(
                                  state.pathParameters['groupMatchId']!);
                              final matchOrder = int.parse(
                                  state.pathParameters['matchOrder']!);

                              return EditGroupMatchScorePage(
                                groupId: groupId,
                                groupMatchId: groupMatchId,
                                matchOrder: matchOrder,
                              );
                            },
                            routes: const [],
                          ),
                        ],
                      ),
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        name: RoutingPath.editGroup,
                        path: RoutingPath.editGroup,
                        builder: (context, state) {
                          final groupId =
                              int.parse(state.pathParameters['groupId']!);
                          return EditGroupPage(
                            groupId: groupId,
                          );
                        },
                        routes: const [],
                      ),
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        name: RoutingPath.groupMembers,
                        path: RoutingPath.groupMembers,
                        builder: (context, state) {
                          final groupId =
                              int.parse(state.pathParameters['groupId']!);
                          return GroupMembersPage(
                            groupId: groupId,
                          );
                        },
                        routes: const [],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutingPath.record,
                builder: (context, state) => const RecordPage(),
                routes: const [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingsNavigatorKey,
            routes: [
              GoRoute(
                path: RoutingPath.settings,
                builder: (context, state) => const SettingsPage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    name: RoutingPath.gameConfig,
                    path: RoutingPath.gameConfig,
                    builder: (context, state) => const GameConfigPage(),
                    routes: const [],
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    name: RoutingPath.editProfile,
                    path: RoutingPath.editProfile,
                    builder: (context, state) => const EditProfilePage(),
                    routes: const [],
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    name: RoutingPath.friends,
                    path: RoutingPath.friends,
                    builder: (context, state) => const FriendsPage(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        name: RoutingPath.inviteFriend,
                        path: RoutingPath.inviteFriend,
                        builder: (context, state) => const InviteFriendPage(),
                        routes: const [],
                      ),
                    ],
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
        path: RoutingPath.profile,
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
      final session = ref.read(authStateNotifierProvider).authState?.session;

      if (session == null) {
        return state.fullPath == RoutingPath.signIn ||
                state.fullPath == RoutingPath.signUp
            ? null
            : RoutingPath.signIn;
      }

      // セッションが存在する & ログインページにいる場合はホームに遷移
      return state.fullPath == RoutingPath.signIn ? RoutingPath.home : null;
    },
    refreshListenable: ref.watch(authStateNotifierProvider),
  ),
);
