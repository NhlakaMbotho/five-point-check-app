import 'dart:async';

import 'package:flutter/material.dart';

class ScrollEventsProvider {
  ScrollController? _horizontalScrollController;
  ScrollController? _verticalScrollController;
  StreamController<double> _horizontalStreamController = StreamController();
  StreamController<double> _verticalStreamController = StreamController();
  StreamSubscription? _horizontalSub;
  StreamSubscription? _verticalSub;

  attachHorizontalScrollInput(ScrollController horizontalScrollController) {
    if (_horizontalScrollController != null) {
      _horizontalScrollController!.dispose();
    }

    _horizontalScrollController = horizontalScrollController;
    _horizontalScrollController!
        .addListener(() => _horizontalStreamController.sink.add(_horizontalScrollController!.offset));
  }

  attachVerticalScrollInput(ScrollController verticalScrollController) {
    if (_verticalScrollController != null) {
      _verticalScrollController!.dispose();
    }

    _verticalScrollController = verticalScrollController;
    _verticalScrollController!.addListener(() => _verticalStreamController.sink.add(_verticalScrollController!.offset));
  }

  attachHorizontalScrollOutput(ScrollController horizontalScrollController) {
    if (_horizontalSub != null) {
      _horizontalSub!.cancel();
    }

    _horizontalSub = _horizontalStreamController.stream.listen((position) {
      horizontalScrollController.jumpTo(position);
    });
  }

  attachVerticalScrollOutput(ScrollController verticalScrollController) {
    if (_verticalSub != null) {
      _verticalSub!.cancel();
    }

    _verticalSub = _verticalStreamController.stream.listen((position) {
      verticalScrollController.jumpTo(position);
    });
  }

  void dispose() {
    _verticalScrollController!.dispose();
    _horizontalScrollController!.dispose();

    _horizontalStreamController.close();
    _verticalStreamController.close();
  }
}
