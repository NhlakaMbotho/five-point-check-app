import 'package:driving_school_app/auth-guard.dart';

import 'package:driving_school_app/providers/authentication_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/instructor_provider.dart';
import 'providers/router_auth_provider.dart';
import 'routes/router.gr.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = MainRouter(authGuard: AuthGuard());
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ListenableProvider(create: (_) => UIEventsProvider()),
          ListenableProvider(create: (_) => InstructorProvider()),
          ListenableProvider(create: (_) => AuthProvider()),
          ListenableProvider(create: (_) => UserProvider()),
        ],
        child: Consumer<AuthProvider>(builder: (context, authentication, _) {
          if (!authentication.isAuthenticated) {
            _appRouter.replaceAll([LoginRoute()]);
          }
          // print('auth change picked up in root object');
          return MaterialApp.router(
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        }));
  }

  dispose() {}
}
