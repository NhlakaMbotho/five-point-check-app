import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class Footer extends StatelessWidget {
  final LinkedScrollControllerGroup verticalControllersGroup;
  final ScrollController scrollBarController = new ScrollController();

  Footer(this.verticalControllersGroup);

  handleScrollEvents() {
    verticalControllersGroup.addOffsetChangedListener(() {
      if (verticalControllersGroup.offset != scrollBarController.offset &&
          scrollBarController.hasClients) {
        this.scrollBarController.jumpTo(verticalControllersGroup.offset);
      }
    });

    this.scrollBarController.addListener(() {
      if (verticalControllersGroup.offset != scrollBarController.offset) {
        this.verticalControllersGroup.jumpTo(scrollBarController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    handleScrollEvents();
    var schedulerDimensions = SchedulerDimensions(context);
    return Container(
      child: RawScrollbar(
        thickness: 8.0,
        isAlwaysShown: true,
        thumbColor: Colors.red,
        controller: scrollBarController,
        notificationPredicate: (val) {
          return true;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: scrollBarController,
          child: Placeholder(
            color: Colors.blueGrey,
            fallbackHeight: schedulerDimensions.bottomPanelHeight,
            fallbackWidth: schedulerDimensions.swimLaneWidth,
          ),
        ),
      ),
      height: schedulerDimensions.bottomPanelHeight,
      width: schedulerDimensions.middlePanelWidth,
      margin: EdgeInsets.only(
        left: schedulerDimensions.leftPanelWidth,
        right: schedulerDimensions.rightPanelWidth,
      ),
    );
  }
}
