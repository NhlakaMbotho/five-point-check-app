import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/models/lesson.dart';
import 'package:driving_school_app/utilities/config_helper.dart';
import 'package:flutter/material.dart';

class SessionList extends StatelessWidget {
  double cardWidth;
  dynamic tradingHours;
  Instructor instructor;
  double height;
  SessionList(Instructor instructor, height) {
    this.cardWidth =
        getConfigValue(["dimensions", "compoments", "scheduler", "cardWidth"]);
    this.tradingHours = getConfigValue(["tradingHours"]);
    this.instructor = instructor;
    this.height = height;
  }

  List<Widget> getBlocks(height, List<Lesson> lessons) {
    List<Widget> list = [];
    double width = 0;

    if (lessons.length == 0) {
      return [
        Container(
          color: Colors.transparent,
          width: getWidth(),
        )
      ];
    }

    for (var i = tradingHours["start"]; i <= tradingHours["end"]; i++) {
      var atBeginingOfLesson = lessons.any((lesson) => lesson.start.hour == i);
      var atEndOfLesson = lessons.any((lesson) => lesson.endTime.hour == i);

      // Lesson End
      if (atEndOfLesson) {
        list.add(Container(
          decoration: BoxDecoration(color: Colors.green),
          width: width,
        ));
        width = 0;
      }

      // Lesson Start
      if (atBeginingOfLesson) {
        if (width > 0) {
          list.add(Container(
            color: Colors.transparent,
            width: width,
          ));
          width = 0;
        }
      }

      width += this.cardWidth;
    }

    if (width > 0) {
      list.add(Container(
        color: Colors.transparent,
        width: width,
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: getBlocks(height, instructor.lessons),
    );
  }
}
