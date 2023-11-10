import 'package:driving_school_app/providers/scroll_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/instructor.dart';
import '../../models/scheduler_dimensions.dart';
import 'footer.dart';
import 'main_panel.dart';
import 'avatar_wrapper.dart';
import 'right_scroll_bar.dart';
import 'header.dart';

class SchedulerWrapperPanel extends StatelessWidget {
  final List<Instructor> _instructors;

  const SchedulerWrapperPanel(this._instructors);

  double fullSwimlaneHeight(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    return _instructors.length * schedulerDimensions.cardHeight +
        (schedulerDimensions.cardSeparatorHeight * (_instructors.length + 1));
  }

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    var swimlaneHeight = fullSwimlaneHeight(context);

    return Provider(
      create: (context) => ScrollEventsProvider(),
      child: Container(
        width: schedulerDimensions.outerWidth,
        height: schedulerDimensions.outerHeight,
        decoration: BoxDecoration(
          color: AppColors.GreyLight,
          // borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(
              child: Row(
                children: [
                  LeftAvatarWrapper(schedulerDimensions.middlePanelHeight, schedulerDimensions.leftPanelWidth),
                  MainPanel(
                    cardWidth: schedulerDimensions.cardWidth,
                    instructors: _instructors,
                  ),
                  RightScrollBar(
                    swimlaneHeight,
                  ),
                ],
              ),
              height: schedulerDimensions.middlePanelHeight,
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
