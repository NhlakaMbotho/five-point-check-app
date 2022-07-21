// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/auth-guard.dart';
import 'package:driving_school_app/pages/dashboard_screen.dart';
import 'package:driving_school_app/pages/profile_screen.dart';
import 'package:driving_school_app/pages/settings_screen.dart';
import '../pages/clients_screen.dart';
import '../pages/instructors_screen.dart';
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
        AutoRoute(page: InstructorsPage, path: 'instructors'),
        AutoRoute(page: ClientsPage, path: 'clients'),
        RedirectRoute(path: 'login', redirectTo: '/login')
      ],
    ),
    AutoRoute(page: LoginPage, path: '/login'),
  ],
)
class $MainRouter {}
