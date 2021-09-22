import 'package:driving_school_app/core_widgets/base_app_widget.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:driving_school_app/sandbox/main_section/scheduler/swimlane_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'guideline_list.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class ScheduleWrapper extends StatelessWidget with BaseAppWidget {
  final double height;
  ScheduleWrapper(this.height);

  List<Instructor> getInstructors(context) =>
      Provider.of<InstructorProvider>(context, listen: false).getAll();

  @override
  Widget build(BuildContext context) {
    var uiProvider = Provider.of<UIEventsProvider>(context, listen: false);
    var instructors = getInstructors(context);

    return Flexible(
      /**
       * Vertical Scroll View
       */
      child: NotificationListener<OverscrollIndicatorNotification>(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              /**
               * Timestamp Guidelines
               */
              GuideLines(instructors, height),
              /**
               * Horizontal Scroll View
               */
              SwimlaneList(instructors, height),
            ],
          ),
          scrollDirection: Axis.horizontal,
          controller: uiProvider.sharedHorizontalController,
        ),
        onNotification: (notification) {
          notification.disallowGlow();
          return false;
        },
      ),
    );
  }
}
