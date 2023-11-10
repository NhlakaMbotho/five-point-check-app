import 'package:flutter/rendering.dart';

class ScrollDataPoint {
  final double position;
  final ScrollDirection direction;

  const ScrollDataPoint(this.position, this.direction);

  @override
  String toString() {
    return "position -> $position, direction -> ${direction}";
  }
}
