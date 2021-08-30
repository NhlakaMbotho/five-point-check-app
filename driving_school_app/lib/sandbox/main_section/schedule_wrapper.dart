import 'package:driving_school_app/core_widgets/base_app_widget.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleWrapper extends StatelessWidget with BaseAppWidget {
  final double height;
  ScheduleWrapper(this.height);

  List<Instructor> getInstructors(context) =>
      Provider.of<InstructorProvider>(context, listen: false).getAll();

  @override
  Widget build(BuildContext context) {
    var uiProvider = Provider.of<UIEventsProvider>(context, listen: false);
    var instructors = getInstructors(context);

    return Flexible(
      /**
       * Vertical Scroll View
       */
      child: SingleChildScrollView(
        child: Stack(
          children: [
            /**
             * Timestamp Guidelines
             */
            GuideLines(instructors, height),
            /**
             * Horizontal Scroll View
             */
            SwimlaneList(instructors, height),
          ],
        ),
        scrollDirection: Axis.horizontal,
        controller: uiProvider.sharedHorizontalController,
        physics: BouncingScrollPhysics(),
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
    var dimensions = getConfigValue(["dimensions", "compoments", "scheduler"]);

    return Container(
      child: ListView.separated(
        itemBuilder: (BuildContext ctx, int index) => Container(
          height: 100,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment(0.021, .5),
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
          ),
        ),
        separatorBuilder: (BuildContext ctx, int index) {
          return Container(
            height: 10,
            color: Color(0xFFF2F2F2),
          );
        },
        itemCount: instructors.length,
        controller: uiProvider.sharedVerticalController,
      ),
      height: height,
      width: getWidth(),
    );
  }
}

class GuideLines extends StatelessWidget with BaseAppWidget {
  final List<Instructor> instructors;
  final double height;

  GuideLines(this.instructors, this.height);

  List<Widget> getGuidelinesWidget(context) {
    var hours = getConfigValue(["timestamps"]) as int;
    var cardWidth =
        getConfigValue(["dimensions", "compoments", "scheduler", "cardWidth"])
            as double;

    List<Widget> list = [];
    var height = instructors.length * 100.0;
    var tradingHours = {"start": 7, "end": 16};

    for (var i = tradingHours["start"];
        i < hours && i <= tradingHours["end"];
        i++) {
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
    return Container(
      child: Row(children: getGuidelinesWidget(context)),
      height: height,
    );
  }
}
