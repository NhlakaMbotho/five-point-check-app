import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/scheduler_dimensions.dart';
import '../../providers/instructor_provider.dart';

class BackgroundSwimlanes extends StatelessWidget {
  final ScrollController controller;

  BackgroundSwimlanes(this.controller);

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    var _instructors =
        Provider.of<InstructorProvider>(context, listen: false).getAll();
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
      itemCount: _instructors.length,
      controller: controller,
      scrollDirection: Axis.vertical,
    );
  }
}
