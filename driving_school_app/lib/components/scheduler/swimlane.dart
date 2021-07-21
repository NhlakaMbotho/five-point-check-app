import 'package:flutter/material.dart';

class Swimlane extends StatelessWidget {
  final double height;

  Swimlane(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: DecoratedBox(
        child: SizedBox.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment(0.05, 0.26),
            tileMode: TileMode.repeated,
            colors: <Color>[
              Colors.black.withOpacity(0.03),
              Colors.black.withOpacity(0.03),
              Colors.transparent,
              Colors.transparent,
            ],
            stops: <double>[0.0, 0.6, 0.6, 0.6],
          ),
        ),
      ),
    );
  }
}
