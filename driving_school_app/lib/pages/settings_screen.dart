import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/routes/router.gr.dart';
import 'package:flutter/material.dart';

class CustomArgs {
  final String name;
  final String body;
  CustomArgs(this.name, this.body);
}

class SettingsPage extends StatelessWidget {
  static const routeName = '/example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Page'),
        primary: false,
      ),
      body: Center(
        child: Row(
          children: [
            Center(child: Text('Example Page Body')),
            ElevatedButton(
                child: Text('Logout!'),
                onPressed: () {
                  AutoRouter.of(context).replaceAll([LoginRoute()]);
                }),
          ],
        ),
      ),
    );
  }
}
