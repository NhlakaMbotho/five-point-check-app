import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class RightScrollBar extends StatelessWidget {
  final LinkedScrollControllerGroup verticalControllers;
  final ScrollController scrollBarController = new ScrollController();
  final double swimlaneHeight;
  RightScrollBar(this.verticalControllers, this.swimlaneHeight);

  handleScrollEvents() {
    verticalControllers.addOffsetChangedListener(() {
      if (verticalControllers.offset != scrollBarController.offset &&
          scrollBarController.hasClients) {
        this.scrollBarController.jumpTo(verticalControllers.offset);
      }
    });

    this.scrollBarController.addListener(() {
      if (verticalControllers.offset != scrollBarController.offset) {
        this.verticalControllers.jumpTo(scrollBarController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    handleScrollEvents();
    var dimensions = SchedulerDimensions(context);
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
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: SizedBox(
              child: Container(
                color: Colors.transparent,
                height: swimlaneHeight,
              ),
              height: swimlaneHeight,
              width: dimensions.rightPanelWidth,
            ),
            controller: scrollBarController,
          ),
        ),
      ),
      width: 14,
    );
  }
}
