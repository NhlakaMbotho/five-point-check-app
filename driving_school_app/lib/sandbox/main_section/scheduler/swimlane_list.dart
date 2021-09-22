import 'package:driving_school_app/core_widgets/base_app_widget.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:driving_school_app/sandbox/main_section/scheduler/session_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwimlaneList extends StatelessWidget with BaseAppWidget {
  final List<Instructor> instructors;
  final double height;
  final ScrollPhysics physics = BouncingScrollPhysics();

  SwimlaneList(this.instructors, this.height);

  @override
  Widget build(BuildContext context) {
    var uiProvider = Provider.of<UIEventsProvider>(context, listen: false);

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
            child: SessionList(instructors[index], height),
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
        scrollDirection: Axis.vertical,
      ),
      height: height,
      width: getWidth(),
    );
  }
}
