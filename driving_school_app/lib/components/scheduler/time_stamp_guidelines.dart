import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/scheduler_dimensions.dart';
import '../../providers/instructor_provider.dart';

class TimestampGuideLines extends StatelessWidget {
  TimestampGuideLines();

  List<Widget> getTimestampWidgets(
      BuildContext context, SchedulerDimensions schedulerDimensions) {
    List<Widget> list = [];

    for (var i = 0; i < schedulerDimensions.totalHours; i++) {
      list.add(
        Container(
          color: Colors.transparent,
          height: getHeight(context, schedulerDimensions.cardHeight),
          width: schedulerDimensions.cardWidth,
          child: Row(
            children: [
              Container(
                width: 6,
                height: getHeight(context, schedulerDimensions.cardHeight),
                color: Colors.grey.withOpacity(.08),
              )
            ],
          ),
        ),
      );
    }

    return list;
  }

  getInstructors(context) =>
      Provider.of<InstructorProvider>(context, listen: false).getAll();

  double getHeight(BuildContext context, cardHeight) {
    var _instructors = this.getInstructors(context);
    var fullLength = _instructors.length * cardHeight;
    return fullLength + ((_instructors.length - 1) * 16);
  }

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    return SizedBox(
      child: Container(
        child: Row(children: getTimestampWidgets(context, schedulerDimensions)),
      ),
      height: schedulerDimensions.middlePanelHeight,
      width: schedulerDimensions.swimLaneWidth,
    );
  }
}
