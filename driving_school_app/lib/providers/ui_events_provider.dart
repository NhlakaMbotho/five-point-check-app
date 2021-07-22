import 'package:flutter/material.dart';

class UIEventsProvider with ChangeNotifier {
  double _horizontalScrollPosition = 0;
  double _verticalScrollPosition = 0;
  ScrollController sharedController = new ScrollController();

  updateScrollPosition(double offset) {
    _horizontalScrollPosition = offset;
    notifyListeners();
  }

  updateVerticalScrollPosition(double offset) {
    _verticalScrollPosition = offset;
    notifyListeners();
  }

  double get horizontalScrollPosition {
    return _horizontalScrollPosition;
  }

  double get verticallScrollPosition {
    return _verticalScrollPosition;
  }

  UIEventsProvider() {
    notifyListeners();
  }
}
