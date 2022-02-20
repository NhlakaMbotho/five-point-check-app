import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:driving_school_app/utilities/config_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FooterSection extends StatelessWidget {
  final ScrollController _localController;
  final double _width;
  final double _height;
  FooterSection(this._height, this._width, this._localController);

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: _localController,
      isAlwaysShown: true,
      thickness: _height,
      radius: Radius.circular(5),
      thumbColor: Colors.grey.withOpacity(.1),
      child: SingleChildScrollView(
        child: Container(
          // color: Colors.lightBlue,
          height: _height,
          width: getWidth(),
        ),
        scrollDirection: Axis.horizontal,
        controller: _localController,
      ),
    );
  }
}
