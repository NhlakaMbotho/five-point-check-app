import 'package:driving_school_app/pages/example_page.dart';
import 'package:driving_school_app/pages/home_page4.dart';
import 'package:driving_school_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await GlobalConfiguration().loadFromPath("config/app_settings.json");
  } catch (error) {
    print('Error: $error');
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainContainer(),
        '/login': (context) => LoginPage(),
        ExamplePage.routeName: (context) => ExamplePage(),
      },
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Color(0xFF0099B4),
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Helvetica Neue',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(
            fontSize: 9.0,
            decoration: TextDecoration.none,
            color: Color(0xFF0099B4),
          ),
        ),
      ),
      // home: Scaffold(backgroundColor: Color(0xFF8F7F7), body: MainContainer()),
    );
  }
}
