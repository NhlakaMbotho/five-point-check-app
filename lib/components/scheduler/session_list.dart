import 'package:driving_school_app/components/scheduler/lesson_widget.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/models/lesson.dart';
import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:driving_school_app/utilities/config_helper.dart';
import 'package:flutter/material.dart';

class InstructorSessionLine extends StatelessWidget {
  final Instructor instructor;
  InstructorSessionLine(this.instructor);

  int getHourByIndex(int index, int startHour) {
    return startHour + index;
  }

  List<Widget> getBlocks(SchedulerDimensions dimensions) {
    int tradingHours = dimensions.totalHours;
    int tradingStartHour = getConfigValue(["tradingHours", "start"]) as int;
    List<Widget> list = [];

    if (instructor.lessons.length == 0) {
      return [
        Container(
          color: Colors.transparent,
          width: dimensions.blockSize.width,
        )
      ];
    }

    int i = 0;
    do {
      int currentHour = getHourByIndex(i, tradingStartHour);

      try {
        Lesson _lesson = instructor.lessons.firstWhere((lesson) => lesson.start.hour == currentHour);
        if (_lesson.start.hour == _lesson.endTime.hour) {
          i++;
          continue;
        }
        int hourCount = _lesson.endTime.hour - _lesson.start.hour;
        double currentLessonWidth = dimensions.blockSize.width * hourCount;
        list.add(LessonWidget(_lesson, currentLessonWidth, dimensions.blockSize.height));
        i += hourCount;
      } on StateError {
        int k = i;
        double width = 0;
        while (!instructor.lessons.any((lesson) => lesson.start.hour == getHourByIndex(k, tradingStartHour)) &&
            k < tradingHours) {
          width += dimensions.blockSize.width;
          k++;
        }
        if (k > i) {
          list.add(SizedBox(width: width));
        }
        i = k;
      }
    } while (i < tradingHours);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = SchedulerDimensions.of(context);
    return SizedBox(
      height: dimensions.blockSize.height,
      child: Row(
        children: getBlocks(dimensions),
      ),
    );
  }
}
