import 'package:driving_school_app/core_widgets/base_app_widget.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleWrapper extends StatelessWidget {
  final double height;
  ScheduleWrapper(this.height);

  @override
  Widget build(BuildContext context) {
    var uiProvider = Provider.of<UIEventsProvider>(context, listen: false);
    var instructors =
        Provider.of<InstructorProvider>(context, listen: false).getAll();

    return Flexible(
      /**
       * Vertical Scroll View
       */
      child: SingleChildScrollView(
        /**
         * Horizontal Scroll View
         */
        child: SwimlaneList(instructors, height),
        scrollDirection: Axis.horizontal,
        controller: uiProvider.sharedHorizontalController,
      ),
    );
  }
}

class SwimlaneList extends StatelessWidget with BaseAppWidget {
  final List<Instructor> instructors;
  final double height;
  final ScrollPhysics physics = BouncingScrollPhysics();

  SwimlaneList(this.instructors, this.height);

  @override
  Widget build(BuildContext context) {
    var uiProvider = Provider.of<UIEventsProvider>(context, listen: false);
    var dimensions = getDimensions(["dimensions", "compoments", "scheduler"]);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment(0.018, .11),
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
      child: ListView.separated(
        itemBuilder: (BuildContext ctx, int index) => Container(
          height: 100,
          child: Container(
            color: Colors.transparent,
          ),
        ),
        separatorBuilder: (BuildContext ctx, int index) {
          return Container(
            height: 10,
            color: Theme.of(context).accentColor,
          );
        },
        itemCount: instructors.length,
        physics: physics,
        controller: uiProvider.sharedVerticalController,
      ),
      height: height,
      width: dimensions["mainWidth"] as double,
    );
  }
}
