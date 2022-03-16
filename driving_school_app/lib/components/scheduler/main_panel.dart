import 'package:flutter/material.dart';

import '../../models/instructor.dart';
import '../../models/scheduler_dimensions.dart';
import 'background_swimlane.dart';
import 'time_stamp_guidelines.dart';

class MainPanel extends StatelessWidget {
  final ScrollController _controller;
  final double height;
  final List<Instructor> _instructors;
  MainPanel(this._controller, this.height, this._instructors);

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SizedBox(
        height: schedulerDimensions.middlePanelHeight,
        width: schedulerDimensions.swimLaneWidth,
        child: Stack(
          children: [
            TimestampGuideLines(),
            BackgroundSwimlanes(this._controller),
          ],
        ),
      ),
    );
  }
}
