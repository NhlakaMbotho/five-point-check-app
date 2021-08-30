import 'package:driving_school_app/core_widgets/base_app_widget.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:flutter/material.dart';

class GuideLines extends StatelessWidget with BaseAppWidget {
  final List<Instructor> instructors;
  final double height;

  GuideLines(this.instructors, this.height);

  List<Widget> getGuidelinesWidget(context) {
    var hours = getConfigValue(["timestamps"]) as int;
    var cardWidth =
        getConfigValue(["dimensions", "compoments", "scheduler", "cardWidth"])
            as double;

    List<Widget> list = [];
    var height = instructors.length * 100.0;
    var tradingHours = {"start": 7, "end": 16};

    for (var i = tradingHours["start"];
        i < hours && i <= tradingHours["end"];
        i++) {
      list.add(
        Container(
          color: Colors.transparent,
          height: height,
          width: cardWidth,
          child: Row(
            children: [
              Container(
                width: 6,
                height: height,
                color: Colors.grey.withOpacity(.08),
              )
            ],
          ),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: getGuidelinesWidget(context)),
      height: height,
    );
  }
}
