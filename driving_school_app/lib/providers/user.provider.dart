import 'package:driving_school_app/models/user.dart';
import 'package:driving_school_app/providers/base_http_provider.dart';
import 'package:flutter/material.dart';

class UserProvider extends BaseHttpProvider with ChangeNotifier {
  User user;
  UserProvider() {}

  setUser(User user) {
    this.user = user;
  }
}