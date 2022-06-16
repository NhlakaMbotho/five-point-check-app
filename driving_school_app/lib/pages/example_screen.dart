// import 'package:driving_school_app/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routes/router.gr.dart';

class CustomArgs {
  final String name;
  final String body;
  CustomArgs(this.name, this.body);
}

class ExamplePage extends StatelessWidget {
  static const routeName = '/example';

  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)?.settings.arguments;

    return Center(
      child: Row(
        children: [
          Center(child: Text('Parsed body: ')),
          ElevatedButton(
              child: Text('Logout!'),
              onPressed: () {
                // Navigate to second route when tapped.
                AutoRouter.of(context).replaceAll([LoginRoute()]);
              }),
        ],
      ),
    );
  }
}
