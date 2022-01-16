import 'dart:convert';

import 'package:driving_school_app/models/sign_up.dart';
import 'package:driving_school_app/providers/base_http_provider.dart';
import 'package:flutter/material.dart';

class AuthProvider extends BaseHttpProvider with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  AuthProvider() {}

  bool get isAuthenticated {
    return _token != null;
  }

  signIn(String username, String password) {
    post('/api/v1/auth/login', jsonEncode({username, password}));
  }

  signUp(SignUp form) {
    post<SignUp>('/api/v1/auth/register', jsonEncode(form));
  }
}
