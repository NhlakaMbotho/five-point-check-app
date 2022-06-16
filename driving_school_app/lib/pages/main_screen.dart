import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../components/main_menu.dart';
import '../models/app-nav.dart';
import '../routes/router.gr.dart';

class MainPage extends StatelessWidget {
  final List<AppNav> navOptions = [
    AppNav('Home', Icons.home, DashboardRoute()),
    AppNav('Profile', Icons.person, ExampleRoute()),
    AppNav('Settings', Icons.settings, SettingsRoute()),
    AppNav('Logout', Icons.logout, LoginRoute()),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashboardRoute(),
        SettingsRoute(),
      ],
      builder: (ctx, child, _) {
        return Row(
          children: [
            LeftMenu(navOptions),
            Flexible(
              child: child,
            ),
          ],
        );
      },
    );
  }
}
