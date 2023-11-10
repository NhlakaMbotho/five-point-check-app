import 'package:driving_school_app/models/snap_scroll_controller.dart';
import 'package:driving_school_app/providers/scroll_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/scheduler_dimensions.dart';
import '../../providers/instructor_provider.dart';
import 'session_list.dart';

class BackgroundSwimlanes extends StatefulWidget {
  BackgroundSwimlanes();

  @override
  State<BackgroundSwimlanes> createState() => _BackgroundSwimlanesState();
}

class _BackgroundSwimlanesState extends State<BackgroundSwimlanes> {
  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    var controller = SnapScrollController(schedulerDimensions.cardHeight);

    var instructors = Provider.of<InstructorProvider>(context, listen: false).getAll();

    Provider.of<ScrollEventsProvider>(context).attachVerticalScrollInput(controller);

    return ListView.separated(
      itemBuilder: (_, int index) {
        return Stack(children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment(0.045, .4),
                tileMode: TileMode.repeated,
                colors: <Color>[
                  Colors.transparent,
                  Colors.transparent,
                  Colors.grey.withOpacity(.14),
                  Colors.grey.withOpacity(.07),
                ],
                stops: <double>[0, .5, .5, 0],
              ),
            ),
            height: schedulerDimensions.cardHeight,
            width: schedulerDimensions.swimLaneWidth,
          ),
          InstructorSessionLine(instructors[index])
        ]);
      },
      separatorBuilder: (_, int index) => Divider(
        height: schedulerDimensions.cardSeparatorHeight,
        color: AppColors.GreyLight,
      ),
      itemCount: instructors.length,
      controller: controller,
      scrollDirection: Axis.vertical,
    );
  }
}
