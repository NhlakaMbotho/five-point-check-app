import 'package:flutter/material.dart';

class MainScheduler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width * 0.2;
    double maxHeight = MediaQuery.of(context).size.height * 0.2;

    print(
        'heigh: $maxHeight, width: $maxWidth, size:  ${MediaQuery.of(context).size}');
    return Container(
      width: 20.0, //maxWidth,
      height: 20.0,
    );
  }
}
