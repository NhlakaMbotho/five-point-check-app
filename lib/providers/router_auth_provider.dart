import 'package:flutter/material.dart';

class RouterAuthProvider with ChangeNotifier {
  bool isAuthenticated = false;

  RouterAuthProvider();

  void updateState(bool value) {
    this.isAuthenticated = value;
    notifyListeners();
  }
}
