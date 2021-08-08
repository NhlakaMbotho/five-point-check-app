import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleWrapper extends StatelessWidget {
  final double height;
  final ScrollController _scrollController = new ScrollController();
  ScheduleWrapper(this.height);

  // void _broadcastScrollPosition(
  //   UIEventsProvider uiEvents,
  // ) {
  //   if (scrollController.offset != uiEvents.horizontalScrollPosition) {
  //     uiEvents.updateScrollPosition(scrollController.offset);
  //   }
  // }
  // _updateScrollPosition(double val) {
  //   scrollController.jumpTo(val);
  // }

  @override
  Widget build(BuildContext context) {
    var uiProvider = Provider.of<UIEventsProvider>(context, listen: false);
    var instructors =
        Provider.of<InstructorProvider>(context, listen: false).getAll();

    // uiProvider.addListener(
    //     () => _updateScrollPosition(uiProvider.horizontalScrollPosition));
    // scrollController.addListener(() => _broadcastScrollPosition(uiProvider));

    return Flexible(
      child: NotificationListener<ScrollNotification>(
        child: SingleChildScrollView(
          child: Container(
            child: SwimlaneList(instructors, height),
            width: 3000,
          ),
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
        ),
        onNotification: (ScrollNotification scrollInfo) {
          print("swimlane horizontal offset: " +
              _scrollController.offset.toString());
          // HEY!! LISTEN!!
          // this will set controller1's offset the same as controller2's
          return false;
        },
      ),
    );
  }
}

class SwimlaneList extends StatelessWidget {
  final List<Instructor> instructors;
  final double height;
  final ScrollPhysics physics = BouncingScrollPhysics();
  final ScrollController _controller = ScrollController();

  SwimlaneList(this.instructors, this.height);

  @override
  Widget build(BuildContext context) {
    var uiProvider = Provider.of<UIEventsProvider>(context, listen: false);

    /**
     * Syncronize scroll
     */
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
      child: NotificationListener<ScrollNotification>(
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
          controller: _controller,
        ),
        onNotification: (ScrollNotification scrollInfo) {
          uiProvider.updateScrollPosition(_controller.offset);
          return true;
        },
      ),
      height: height,
      width: 3000,
    );
  }
}
