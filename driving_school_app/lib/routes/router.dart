// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/auth-guard.dart';
import 'package:driving_school_app/pages/example_screen.dart';
import 'package:driving_school_app/pages/home_screen.dart';
import 'package:driving_school_app/pages/settings_screen.dart';

import '../pages/login_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, initial: true, guards: [AuthGuard], path: ''),
    AutoRoute(page: SettingsPage, path: '/settings', guards: [AuthGuard]),
    AutoRoute(page: LoginPage, path: '/login'),
  ],
)
class $MainRouter {}
