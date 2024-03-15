import 'package:finance_app_firebase/core/router/router_utils.dart';
import 'package:finance_app_firebase/feature/presentation/ui/balance_page.dart';
import 'package:finance_app_firebase/feature/presentation/ui/dashboard.dart';
import 'package:finance_app_firebase/feature/presentation/ui/login_page.dart';
import 'package:finance_app_firebase/feature/presentation/ui/main_page.dart';
import 'package:finance_app_firebase/feature/presentation/ui/profile.dart';
import 'package:finance_app_firebase/feature/presentation/ui/register_page.dart';
import 'package:finance_app_firebase/feature/presentation/ui/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router =
    GoRouter(initialLocation: '/', navigatorKey: _rootNavigatorKey, routes: [
  GoRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: Pages.auth.screenPath,
    name: Pages.auth.screenName,
    builder: (context, state) {
      return const LoginPage();
    },
  ),
  GoRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: Pages.register.screenPath,
    name: Pages.register.screenName,
    builder: (context, state) {
      return const RegisterPage();
    },
  ),
  ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainPage(location: state.location, child: child);
      },
      routes: [
        GoRoute(
            path: Pages.dashboard.screenPath,
            name: Pages.dashboard.screenName,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: Dashboard());
            }),
        GoRoute(
            path: Pages.balance.screenPath,
            name: Pages.balance.screenName,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: Balance());
            }),
        GoRoute(
            path: Pages.transactions.screenPath,
            name: Pages.transactions.screenName,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: Transactions());
            }),
        GoRoute(
            path: Pages.profile.screenPath,
            name: Pages.profile.screenName,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: Profile());
            }),
      ])
]);
