import 'package:driving_school_app/models/error.dart';
import 'package:driving_school_app/providers/authentication_provider.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  final _usernameKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  bool _loaderState = false;

  String _username = "1388848603";
  String _password = "pass123";

  @override
  void initState() {
    super.initState();
  }

  void _showLoader(bool val) {
    setState(() {
      _loaderState = val;
    });
  }

  Future<void> submitForm(context) async {
    if (_form.currentState.validate()) {
      _form.currentState.save();

      _showLoader(true);
      try {
        var user = await Provider.of<AuthProvider>(
          context,
          listen: false,
        ).signIn(_username, _password);
        Provider.of<UserProvider>(
          context,
          listen: false,
        ).setUser(user);
        print('navigate to next page !!!');
      } on ServiceError catch (error) {
        showError(error.message);
      } finally {
        _showLoader(false);
      }
    }
  }

  void showError(String message) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Authentication Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DX3 Driving School'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: _loaderState
            ? CircularProgressIndicator(
                semanticsLabel: 'Signing in...',
              )
            : Card(
                child: Form(
                  key: _form,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(40),
                      width: 300,
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (value) =>
                                _usernameKey.currentState.validate(),
                            decoration:
                                InputDecoration(labelText: 'Phone Number'),
                            key: _usernameKey,
                            initialValue: _username,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).nextFocus(),
                            onSaved: (_) => _username = _,
                            validator: (value) => value.length > 0
                                ? null
                                : 'Please enter a valid usernmae',
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            initialValue: _password,
                            key: _passwordKey,
                            onSaved: (_) => _password = _,
                            validator: (value) => value.length > 0
                                ? null
                                : 'Please enter a valid usernmae',
                            onChanged: (_) =>
                                _passwordKey.currentState.validate(),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                minimumSize: Size(88, 36),
                              ),
                              onPressed: () {
                                submitForm(context);
                                print("logging in...");
                              },
                              child: Text("Sign In"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.blue,
                                minimumSize: Size(88, 36),
                              ),
                              onPressed: () {
                                print("logging up...");
                              },
                              child: Text("Sign Up"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
