import 'package:flutter/material.dart';

class UIEventsProvider with ChangeNotifier {
  double _horizontalScrollPosition = 0;

  updateScrollPosition(double offset) {
    _horizontalScrollPosition = offset;
    notifyListeners();
  }

  double get horizontalScrollPosition {
    return _horizontalScrollPosition;
  }

  UIEventsProvider() {
    notifyListeners();
  }
}
