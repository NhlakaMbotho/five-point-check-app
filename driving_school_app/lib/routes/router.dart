// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/auth-guard.dart';
import 'package:driving_school_app/pages/dashboard_screen.dart';
import 'package:driving_school_app/pages/example_screen.dart';
import 'package:driving_school_app/pages/profile_screen.dart';
import 'package:driving_school_app/pages/settings_screen.dart';

import '../components/scheduler/scheduler_wrapper_panel.dart';
import '../pages/login_screen.dart';
import '../pages/main_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: MainPage,
      initial: true,
      guards: [AuthGuard],
      path: '/main',
      children: [
        AutoRoute(page: DashboardPage, path: ''),
        AutoRoute(page: SettingsPage, path: 'settings'),
        AutoRoute(page: ProfilePage, path: 'profile'),
        RedirectRoute(path: 'login', redirectTo: '/login')
      ],
    ),
    AutoRoute(page: LoginPage, path: '/login'),
  ],
)
class $MainRouter {}
