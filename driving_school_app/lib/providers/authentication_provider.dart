import 'dart:convert';

import 'package:driving_school_app/models/sign_up.dart';
import 'package:driving_school_app/models/user.dart';
import 'package:driving_school_app/providers/base_http_provider.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthProvider extends BaseHttpProvider with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  AuthProvider() {}

  bool get isAuthenticated => getToken() != null;

  getToken() {
    if (_token != null &&
        _expiryDate != null &&
        _expiryDate.isAfter(DateTime.now())) {
      return _token;
    }
    return null;
  }

  setToken(String token) {
    this._token = token;
    this._expiryDate = new DateTime.now()
        .add(Duration(microseconds: Jwt.parseJwt(_token)["exp"]));
    print('Exp date: ${this._expiryDate}, get token: $isAuthenticated');
    notifyListeners();
  }

  Future<User> signIn(String cellNo, String password) async {
    var response = await post<User>(
        '/api/auth/login', {"cellNo": cellNo, "password": password});
    var body = User.fromJson(response.getBody());
    this.setToken(body.token);
    return body;
  }

  void logOut() {
    _token = null;
    _expiryDate = null;
    this.notifyListeners();
  }

  Future<User> signUp(SignUp form) async {
    var response = await post<User>('/api/auth/register', {
      "firstName": form.firstName,
      "lastName": form.lastName,
      "identity": form.identity,
      "username": form.username,
      "password": form.password,
      "email": form.email,
      "cellNo": form.cellNo,
      "role": form.role,
      "dateOfBirth": form.dateOfBirth
    });
    var body = response.getBody();
    this.setToken(body.token);
    return body;
  }
}
