import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:driving_school_app/sandbox/main_section/scheduler/swimlane_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'guideline_list.dart';

class ScheduleWrapper extends StatelessWidget {
  final double height;
  final ScrollController _controller;
  ScheduleWrapper(this.height, this._controller);

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
      child: SingleChildScrollView(
        child: Stack(
          children: [
            /**
               * Timestamp Guidelines
               */
            // GuideLines(t),
            /**
               * Horizontal Scroll View
               */
            // SwimlaneList(instructors, height),
          ],
        ),
        scrollDirection: Axis.horizontal,
        controller: _controller,
      ),
    );
  }
}
