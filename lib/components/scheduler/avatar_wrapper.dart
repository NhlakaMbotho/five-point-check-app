import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeftAvatarWrapper extends StatelessWidget {
  final ScrollController _localController;
  final double height;
  final double width;

  LeftAvatarWrapper(
    this.height,
    this.width,
    this._localController,
  );

  getInstructors(context) =>
      Provider.of<InstructorProvider>(context, listen: false).getAll();

  @override
  Widget build(BuildContext context) {
    var instructors = getInstructors(context);
    var schedulerDimensions = SchedulerDimensions(context);
    return SizedBox(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.separated(
          itemBuilder: (_, int index) => InstructorWidget(instructors[index]),
          separatorBuilder: (_, int index) => Divider(
            height: schedulerDimensions.cardSeparatorHeight,
            color: AppColors.GreyLight,
          ),
          itemCount: instructors.length,
          controller: _localController,
        ),
      ),
      width: schedulerDimensions.leftPanelWidth,
      height: schedulerDimensions.middlePanelHeight,
    );
  }
}

class InstructorWidget extends StatelessWidget {
  final Instructor insrtuctor;
  InstructorWidget(this.insrtuctor);
  @override
  Widget build(BuildContext context) {
    SchedulerDimensions dimensions = SchedulerDimensions(context);

    return Container(
      height: dimensions.cardHeight,
      width: dimensions.leftPanelWidth,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: dimensions.cardHeight * 0.8,
            child: Center(
              child: Image(
                image: this.insrtuctor.image.image,
                height: 70,
              ),
            ),
          ),
          Container(
            height: dimensions.cardHeight * 0.2,
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