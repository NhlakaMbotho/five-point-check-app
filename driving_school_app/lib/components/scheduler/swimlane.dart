import 'package:flutter/material.dart';

class Swimlane extends StatelessWidget {
  final double height;
  final int index;

  Swimlane(this.height, this.index);

  @override
  Widget build(BuildContext context) {
    double stopsVal = .5;
    return Container(height: height
        // child: DecoratedBox(child: SizedBox.expand()),
        );
  }
}
