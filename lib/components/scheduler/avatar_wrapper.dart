import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:driving_school_app/models/snap_scroll_controller.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/scroll_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../extensions/scroll_controller.dart';

class LeftAvatarWrapper extends StatelessWidget {
  final ScrollController _localController = ScrollController();

  LeftAvatarWrapper();

  getInstructors(context) => Provider.of<InstructorProvider>(context, listen: false).getAll();

  @override
  Widget build(BuildContext context) {
    Provider.of<ScrollEventsProvider>(context).attachVerticalScrollOutput(_localController);

    var instructors = getInstructors(context);
    var dimensions = SchedulerDimensions.of(context);

    return SizedBox(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.separated(
          itemBuilder: (_, int index) => InstructorWidget(instructors[index]),
          separatorBuilder: (_, int index) => Divider(
            height: 10,
            color: AppColors.GreyLight,
          ),
          itemCount: instructors.length,
          controller: _localController,
        ),
      ),
      width: dimensions.leftPanelWidth,
      height: dimensions.preferredInnerHeight,
    );
  }
}

class InstructorWidget extends StatelessWidget {
  final Instructor insrtuctor;
  InstructorWidget(this.insrtuctor);
  @override
  Widget build(BuildContext context) {
    var dimensions = SchedulerDimensions.of(context);

    return Container(
      height: dimensions.blockSize.height,
      width: dimensions.leftPanelWidth,
      // margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: dimensions.blockSize.height * 0.1),
          Container(
            height: dimensions.blockSize.height * 0.6,
            child: Center(
              child: Image(
                image: this.insrtuctor.image.image,
                height: 70,
              ),
            ),
          ),
          Container(
            height: dimensions.blockSize.height * 0.3,
            child: Center(
              child: Text(
                this.insrtuctor.name,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
