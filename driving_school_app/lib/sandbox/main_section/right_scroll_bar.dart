import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RightScrollBar extends StatelessWidget {
  final ScrollController _localController = ScrollController();
  final double itemHeight;
  RightScrollBar(this.itemHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: itemHeight,
      child: RawScrollbar(
        controller: _localController,
        isAlwaysShown: true,
        thickness: 9,
        radius: Radius.circular(5),
        thumbColor: Color(0xFFe6e6e6),
        child: SingleChildScrollView(
          child: Container(
            // height: _height,
            width: 9,
          ),
          scrollDirection: Axis.vertical,
          controller: _localController,
        ),
      ),
    );
  }
}
