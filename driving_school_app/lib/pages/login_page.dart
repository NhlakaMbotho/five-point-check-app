import 'package:driving_school_app/providers/authentication_provider.dart';
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

  String _username = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
  }

  void _showLoader(bool val) {
    setState(() {
      _loaderState = val;
    });
  }

  void submitForm(context) async {
    if (_form.currentState.validate()) {
      _form.currentState.save();

      _showLoader(true);
      try {
        var response = await Provider.of<AuthProvider>(context, listen: false)
            .signIn(_username, _password);
        print("SUCCESS: ${response.toString()}");
      } catch (error) {
        print("ERROR: ${error.toString()}");
      } finally {
        _showLoader(false);
      }
    }
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
                            autofocus: true,
                            key: _usernameKey,
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
