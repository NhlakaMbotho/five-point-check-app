import 'package:driving_school_app/models/user.dart';
import 'package:driving_school_app/providers/base_http_provider.dart';
import 'package:flutter/material.dart';

class UserProvider extends BaseHttpProvider with ChangeNotifier {
  late User user;
  UserProvider() {}

  setUser(User user) {
    this.user = user;
  }

  Future<List<User>> getAll() async {
    var response = await get<List<User>>('/api/user');
    var list = response.getBody() as List<dynamic>;
    return list.map((user) => new User.fromJson(user)).toList();
  }
}
