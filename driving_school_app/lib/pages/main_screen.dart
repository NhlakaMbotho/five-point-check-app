import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../components/main_menu.dart';
import '../models/app-nav.dart';
import '../routes/router.gr.dart';

class MainPage extends StatelessWidget {
  List<AppNav> _navOptions = [
    AppNav('Home', Icons.home, DashboardRoute()),
    AppNav('Profile', Icons.person, ProfileRoute()),
    AppNav('Accounts', Icons.person, AccountsRoute()),
    AppNav('Settings', Icons.settings, SettingsRoute()),
    AppNav('Logout', Icons.logout_outlined, LoginRoute())
  ];

  /**
   * These are routes that cant be appended to AutoTabsRouter instance because they are not children of the tabs router '/main'
   */
  List<String> excludedRoutes = [
    LoginRoute.name,
  ];

  List<PageRouteInfo<dynamic>> get routes {
    return _navOptions
        .map((nav) => nav.pageRoute)
        .takeWhile((value) => !excludedRoutes.contains(value.routeName))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: routes,
      builder: (ctx, child, _) {
        return Row(
          children: [
            LeftMenu(_navOptions),
            Flexible(
              child: child,
            ),
          ],
        );
      },
    );
  }
}
