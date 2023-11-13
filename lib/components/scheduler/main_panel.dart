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

class MainPanel extends StatefulWidget {
  late final SnapScrollController horizontalController;

  MainPanel({
    required double blockWidth,
  }) {
    horizontalController = SnapScrollController(blockWidth);
  }

  @override
  State<MainPanel> createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  dispose() {
    Provider.of<ScrollEventsProvider>(context).dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<ScrollEventsProvider>(context).attachHorizontalScrollInput(widget.horizontalController);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions.of(context);

    return SizedBox(
      child: SingleChildScrollView(
        child: SizedBox(
          height: schedulerDimensions.preferredInnerHeight,
          width: schedulerDimensions.swimlaneAbsoluteMaxWidth,
          child: Stack(
            children: [
              TimestampGuideLines(),
              BackgroundSwimlanes(schedulerDimensions.blockSize.height + schedulerDimensions.cardSeparatorHeight),
            ],
          ),
        ),
        scrollDirection: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.down,
        controller: widget.horizontalController,
      ),
      width: schedulerDimensions.preferredInnerWidth,
      height: schedulerDimensions.preferredInnerHeight,
    );
  }
}
