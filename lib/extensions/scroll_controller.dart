import 'package:flutter/material.dart';

extension ControllerSync on ScrollController {
  void syncWithOtherController(ScrollController sourceController) {
    sourceController.addListener(() => this.jumpTo(sourceController.offset));
  }
}
