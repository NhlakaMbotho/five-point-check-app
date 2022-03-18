import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final ScrollController horizontalBarController;

  Footer(this.horizontalBarController);

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    return Container(
      child: SizedBox(
        child: SingleChildScrollView(
          child: Placeholder(
            fallbackWidth: schedulerDimensions.swimLaneWidth,
            color: Colors.pink,
          ),
          scrollDirection: Axis.horizontal,
          controller: horizontalBarController,
        ),
        height: schedulerDimensions.bottomPanelHeight,
        width: schedulerDimensions.middlePanelWidth,
      ),
      margin: EdgeInsets.only(
        left: schedulerDimensions.leftPanelWidth,
        right: schedulerDimensions.rightPanelWidth,
      ),
    );
  }
}
