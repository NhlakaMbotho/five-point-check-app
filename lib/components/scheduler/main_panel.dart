import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../models/instructor.dart';
import '../../models/scheduler_dimensions.dart';
import 'background_swimlane.dart';
import 'session_list.dart';
import 'time_stamp_guidelines.dart';

class MainPanel extends StatelessWidget {
  final ScrollController _middleSwimlaneVerticalController;
  final ScrollController _middleSwimlaneHorizontalController;
  final double height;
  final List<Instructor> _instructors;
  MainPanel(
    this._middleSwimlaneVerticalController,
    this._middleSwimlaneHorizontalController,
    this.height,
    this._instructors,
  );

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    return SizedBox(
      child: SingleChildScrollView(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SizedBox(
            height: schedulerDimensions.middlePanelHeight,
            width: schedulerDimensions.swimLaneWidth,
            child: Stack(
              children: [
                TimestampGuideLines(),
                BackgroundSwimlanes(this._middleSwimlaneVerticalController),
              ],
            ),
          ),
        ),
        scrollDirection: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.down,
        controller: _middleSwimlaneHorizontalController,
      ),
      width: schedulerDimensions.middlePanelWidth,
      height: schedulerDimensions.middlePanelHeight,
    );
  }
}
