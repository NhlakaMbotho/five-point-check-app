import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/mixins/base.mixin.dart';
import 'package:driving_school_app/models/error.dart';
import 'package:driving_school_app/providers/authentication_provider.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:driving_school_app/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_button.dart';
import '../components/app_text_form_field.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseMixin {
  final _form = GlobalKey<FormState>();
  final _usernameKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  bool _loaderState = false;

  String _username = "2262923741";
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
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
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
        print('Auth checked for route login - ${Provider.of<AuthProvider>(
          context,
          listen: false,
        ).isAuthenticated}');
        AutoRouter.of(context).replace(MainRoute());
      } on ServiceError catch (error) {
        showError(error.message, context);
      } on SocketException {
        showError('Could not reach server, please check network connection!',
            context);
      } on Error catch (error) {
        showError(error.toString(), context);
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
        backgroundColor: AppColors.Primary,
      ),
      body: Center(
        child: _loaderState
            ? appLoader
            : Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Form(
                  key: _form,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(40),
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppTextFormField(
                            onChanged: (value) =>
                                _usernameKey.currentState?.validate(),
                            label: 'Phone Number',
                            key: _usernameKey,
                            initialValue: _username,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).nextFocus(),
                            onSaved: (_) => _username = _!,
                            validator: (value) => value!.length > 0
                                ? null
                                : 'Please enter a valid username',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextFormField(
                            label: 'Password',
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            initialValue: _password,
                            key: _passwordKey,
                            onSaved: (_) => _password = _ == null ? '' : _,
                            validator: (value) => value!.length > 0
                                ? null
                                : 'Please enter a valid username',
                            onChanged: (_) =>
                                _passwordKey.currentState?.validate(),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: AppButton(
                              selected: true,
                              onPressed: () {
                                submitForm(context);
                                print("logging in...");
                              },
                              child: Text("Sign In"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: AppButton(
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
