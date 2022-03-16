import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/pages/home_screen.dart';
import 'package:driving_school_app/pages/login_screen.dart';
import 'package:driving_school_app/providers/authentication_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/instructor_provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ListenableProvider(
            create: (_) => UIEventsProvider(),
          ),
          ListenableProvider(
            create: (_) => InstructorProvider(),
          ),
          ListenableProvider(
            create: (_) => AuthProvider(),
          ),
          ListenableProvider(
            create: (_) => UserProvider(),
          ),
        ],
        child: Consumer<AuthProvider>(builder: (context, authentication, _) {
          return MaterialApp(
            // routes: {
            //   '/': (context) => MainContainer(),
            //   '/login': (context) => LoginPage(),
            //   ExamplePage.routeName: (context) => ExamplePage(),
            // },
            theme: ThemeData(
              // Define the default brightness and colors.
              brightness: Brightness.light,
              primaryColor: AppColors.Primary,

              // Define the default font family.
              fontFamily: 'Helvetica Neue',

              // Define the default TextTheme. Use this to specify the default
              // text styling for headlines, titles, bodies of text, and more.
              textTheme: TextTheme(
                headline1:
                    TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                headline6:
                    TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                bodyText2: TextStyle(
                  fontSize: 9.0,
                  decoration: TextDecoration.none,
                  color: AppColors.Primary,
                ),
              ),
            ),
            home:
                !authentication.isAuthenticated ? MainContainer() : LoginPage(),
          );
        }));
  }
}
