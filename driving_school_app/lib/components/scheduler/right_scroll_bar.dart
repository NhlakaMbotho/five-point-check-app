import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:flutter/material.dart';

class RightScrollBar extends StatelessWidget {
  final ScrollController rightBarVerticalController;
  final double swimlaneHeight;
  RightScrollBar(this.rightBarVerticalController, this.swimlaneHeight);

  @override
  Widget build(BuildContext context) {
    var dimensions = SchedulerDimensions(context);
    return SingleChildScrollView(
      child: SizedBox(
        child: Placeholder(
          color: Colors.grey,
          fallbackHeight: swimlaneHeight,
        ),
        height: swimlaneHeight,
        width: dimensions.rightPanelWidth,
      ),
      controller: rightBarVerticalController,
    );
  }
}
