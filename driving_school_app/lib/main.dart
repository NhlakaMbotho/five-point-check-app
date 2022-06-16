import 'package:driving_school_app/auth-guard.dart';

import 'package:driving_school_app/providers/authentication_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';
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
          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.light,
            primaryColor: AppColors.Primary,
            backgroundColor: Colors.white,

            // Define the default font family.
            fontFamily: 'Helvetica Neue',

            // Define the default TextTheme. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(
                fontSize: 11,
                decoration: TextDecoration.none,
                color: AppColors.Primary,
              ),
            ),
          ),
        );
      }),
    );
  }

  dispose() {}
}
