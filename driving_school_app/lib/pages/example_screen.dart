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
    final CustomArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Parsed name: ' + args.name),
        primary: false,
      ),
      body: Center(
        child: Row(
          children: [
            Center(child: Text('Parsed body: ' + args.body)),
            ElevatedButton(
                child: Text('Logout!'),
                onPressed: () {
                  // Navigate to second route when tapped.
                  Navigator.pushNamed(context, '/login');
                }),
          ],
        ),
      ),
    );
  }
}
