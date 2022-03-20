import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class Footer extends StatelessWidget {
  final LinkedScrollControllerGroup horizontalControllerGroup;
  final ScrollController scrollBarController = new ScrollController();

  Footer(this.horizontalControllerGroup);

  handleScrollEvents() {
    horizontalControllerGroup.addOffsetChangedListener(() {
      if (horizontalControllerGroup.offset != scrollBarController.offset &&
          scrollBarController.hasClients) {
        this.scrollBarController.jumpTo(horizontalControllerGroup.offset);
      }
    });

    this.scrollBarController.addListener(() {
      if (horizontalControllerGroup.offset != scrollBarController.offset) {
        this.horizontalControllerGroup.jumpTo(scrollBarController.offset);
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
        thumbColor: Color.fromARGB(255, 143, 143, 143),
        radius: Radius.circular(10.0),
        controller: scrollBarController,
        notificationPredicate: (val) {
          return true;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: scrollBarController,
          child: Container(
            color: Colors.transparent,
            height: schedulerDimensions.bottomPanelHeight,
            width: schedulerDimensions.swimLaneWidth,
          ),
        ),
      ),
      height: 14,
      width: schedulerDimensions.middlePanelWidth,
      margin: EdgeInsets.only(
        left: schedulerDimensions.leftPanelWidth,
        right: schedulerDimensions.rightPanelWidth,
      ),
    );
  }
}
