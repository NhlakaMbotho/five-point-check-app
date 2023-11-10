import 'dart:convert';

import 'package:driving_school_app/models/error.dart';
import 'package:driving_school_app/models/sign_up.dart';
import 'package:driving_school_app/models/user.dart';
import 'package:driving_school_app/providers/base_http_provider.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../utilities/global.dart';

class AuthProvider extends BaseHttpProvider with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  AuthProvider() {
    print('Adding global val listener...');
    this.addListener(syncGlobalAuthState);
  }

  syncGlobalAuthState() {
    print('Running global sync...');
    Global.authenticated = isAuthenticated;
  }

  @override
  void dispose() {
    print('Removing global val listener...');
    this.removeListener(syncGlobalAuthState);
    super.dispose();
  }

  bool get isAuthenticated => true;

  getToken() {
    if (_token != null && _expiryDate != null && _expiryDate!.isAfter(DateTime.now())) {
      return _token;
    }
    return null;
  }

  setToken(String token) {
    this._token = token;
    this._expiryDate = new DateTime.now().add(Duration(microseconds: Jwt.parseJwt(token)["exp"]));
    print('Exp date: ${this._expiryDate}, get token: $isAuthenticated');
    notifyListeners();
  }

  Future<User> signIn(String cellNo, String password) async {
    var response = await post<User>('/api/auth/login', {"cellNo": cellNo, "password": password});
    var body = User.fromJson(response.getBody());
    if (body.token != null) {
      this.setToken(body.token!);
    } else {
      throw Exception('Invalid token');
    }
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
