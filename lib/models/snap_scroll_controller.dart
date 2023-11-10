import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SnapScrollController extends ScrollController {
  ScrollDirection _scrollDirection = ScrollDirection.idle;
  final double gridValue;
  final double threshold = 10.0;

  SnapScrollController(this.gridValue) {
    _attachScrollEvents();
  }

  @override
  void jumpTo(double value) {
    if ((value - position.pixels).abs() < threshold) {
      return; // Ignore small scroll movements
    }
    super.jumpTo(value);
  }

  _attachScrollEvents() {
    this.addListener(() {
      _scrollDirection = this.position.userScrollDirection != ScrollDirection.idle
          ? this.position.userScrollDirection
          : _scrollDirection;
      EasyDebounce.debounce(
        '_handleIncomingHorizontalScrollEvents',
        Duration(milliseconds: 100),
        () {
          print('latest scroll position: ${this.offset}, ${_scrollDirection}');
          _snapToDestination();
        },
      );
    });
  }

  _snapToDestination() {
    double destPosition = (this._scrollDirection == ScrollDirection.forward
            ? (position.pixels / gridValue).floor()
            : (position.pixels / gridValue).ceil()) *
        gridValue;

    if (destPosition > position.maxScrollExtent) {
      destPosition = position.maxScrollExtent;
    } else if (destPosition < position.minScrollExtent) {
      destPosition = position.minScrollExtent;
    }
    animateTo(
      destPosition,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
