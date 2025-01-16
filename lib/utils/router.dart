import 'package:dental/features/user/views/appointment_view.dart';
import 'package:dental/features/user/views/history_view.dart';
import 'package:dental/features/user/views/home/home_view.dart';
import 'package:dental/features/user/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:dental/common/views/splash_view.dart';
import 'package:dental/common/views/walkthrough_view.dart';
import 'package:dental/features/message/views/message_detail_view.dart';
import 'package:dental/common/views/dashboard_view.dart';

// Private Navigators
final rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _appointmentNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'appointment');
final _historyNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'history');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final goRouterProvider = Provider<GoRouter>((ref) => router);

final GoRouter router = GoRouter(
  initialLocation: SplashView.routeName,
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: false,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => DashboardView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: HomeView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const HomeView(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _appointmentNavigatorKey,
          routes: [
            GoRoute(
              path: AppointmentView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const AppointmentView(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _historyNavigatorKey,
          routes: [
            GoRoute(
              path: HistoryView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const HistoryView(),
              ),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: ProfileView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const ProfileView(),
              ),
            )
          ],
        ),
      ],
    ),
    // COMMON PAGES
    GoRoute(
      path: SplashView.routeName,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: WalkthroughView.routeName,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const WalkthroughView(),
    ),

    // CHAT PAGES
    GoRoute(
      path: MessageDetailView.routeName,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        var args = state.extra as Map<String, dynamic>;
        return MessageDetailView(
          title: args['title'],
        );
      },
    ),
  ],
);
