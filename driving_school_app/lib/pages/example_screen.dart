// import 'package:driving_school_app/routes/router.gr.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Parsed name: '),
        primary: false,
      ),
      body: Center(
        child: Row(
          children: [
            Center(child: Text('Parsed body: ')),
            ElevatedButton(
                child: Text('Logout!'),
                onPressed: () {
                  // Navigate to second route when tapped.
                  // AutoRouter.of(context).replace(LoginRoute());
                }),
          ],
        ),
      ),
    );
  }
}
