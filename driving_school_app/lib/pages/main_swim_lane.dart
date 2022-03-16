import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../models/instructor.dart';
import '../models/scheduler_dimensions.dart';
import '../providers/instructor_provider.dart';

class MainPanel extends StatelessWidget {
  final ScrollController _controller;
  final double height;
  final List<Instructor> _instructors;
  MainPanel(this._controller, this.height, this._instructors);

  double getHeight(cardHeight) {
    var fullLength = _instructors.length * cardHeight;
    return fullLength + ((_instructors.length - 1) * 16);
  }

  double fullSwimlaneH(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    return _instructors.length * schedulerDimensions.cardHeight +
        (schedulerDimensions.cardSeparatorHeight * (_instructors.length + 1));
  }

  getInstructors(context) =>
      Provider.of<InstructorProvider>(context, listen: false).getAll();

  @override
  Widget build(BuildContext context) {
    final List<Instructor> instructors = getInstructors(context);
    var schedulerDimensions = SchedulerDimensions(context);
    var height = schedulerDimensions.swimLaneWidth;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SizedBox(
        height: schedulerDimensions.middlePanelHeight,
        width: schedulerDimensions.swimLaneWidth,
        child: Stack(
          children: [
            SizedBox(
              child: Container(
                child: TimestampGuideLines(
                  schedulerDimensions.totalHours as double,
                  getHeight(schedulerDimensions.cardHeight),
                  schedulerDimensions.cardWidth,
                ),
              ),
              height: schedulerDimensions.middlePanelHeight,
              width: schedulerDimensions.swimLaneWidth,
            ),
            BackgroundSwimlanes(
              this._instructors,
              this._controller,
            ),
          ],
        ),
      ),
    );
  }
}

class TimestampGuideLines extends StatelessWidget {
  final double tradingHours;
  final double height;
  final double cardWidth;

  TimestampGuideLines(this.tradingHours, this.height, this.cardWidth);

  List<Widget> getTimestampWidgets() {
    List<Widget> list = [];

    for (var i = 0; i < this.tradingHours; i++) {
      list.add(
        Container(
          color: Colors.transparent,
          height: height,
          width: cardWidth,
          child: Row(
            children: [
              Container(
                width: 6,
                height: height,
                color: Colors.grey.withOpacity(.08),
              )
            ],
          ),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: getTimestampWidgets(),
    );
  }
}

class BackgroundSwimlanes extends StatelessWidget {
  final List<Instructor> instructors;
  final ScrollController controller;

  BackgroundSwimlanes(
    this.instructors,
    this.controller,
  );

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    return ListView.separated(
      itemBuilder: (_, int index) {
        return Container(
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
        );
      },
      separatorBuilder: (_, int index) => Divider(
        height: 16,
        color: AppColors.GreyLight,
      ),
      itemCount: instructors.length,
      controller: controller,
      scrollDirection: Axis.vertical,
    );
  }
}
