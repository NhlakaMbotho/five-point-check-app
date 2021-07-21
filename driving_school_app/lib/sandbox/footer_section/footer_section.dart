import 'package:driving_school_app/core_widgets/base_app_widget.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget with BaseAppWidget {
  @override
  Widget build(BuildContext context) {
    var dimensions = getDimensions(["dimensions", "compoments", "scheduler"]);

    print(dimensions);
    return Container(
      height: 40,
      child: Container(
        child: Placeholder(),
        padding: EdgeInsets.only(
          left: dimensions["leftSideBar"] as double,
          right: dimensions["rightSideBar"] as double,
        ),
      ),
    );
  }
}
