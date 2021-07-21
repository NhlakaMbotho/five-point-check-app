import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('GO Home!'),
          onPressed: () {
            // Navigate to second route when tapped.

            Navigator.pushNamed(context, '/');
          },
        ),
      ),
    );
  }
}
