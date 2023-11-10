import 'package:driving_school_app/models/snap_scroll_controller.dart';
import 'package:driving_school_app/providers/scroll_events_provider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../models/instructor.dart';
import '../../models/scheduler_dimensions.dart';
import 'background_swimlane.dart';
import 'time_stamp_guidelines.dart';

@immutable
class MainPanel extends StatelessWidget {
  late final SnapScrollController verticalController;

  MainPanel({
    required double cardWidth,
    required List<Instructor> instructors,
  }) {
    verticalController = SnapScrollController(cardWidth);
  }

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    Provider.of<ScrollEventsProvider>(context).attachHorizontalScrollInput(verticalController);
    return SizedBox(
      child: SingleChildScrollView(
        child: SizedBox(
          height: schedulerDimensions.middlePanelHeight,
          width: schedulerDimensions.swimLaneWidth,
          child: Stack(
            children: [
              TimestampGuideLines(),
              BackgroundSwimlanes(),
            ],
          ),
        ),
        scrollDirection: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.down,
        controller: verticalController,
      ),
      width: schedulerDimensions.middlePanelWidth,
      height: schedulerDimensions.middlePanelHeight,
    );
  }
}
