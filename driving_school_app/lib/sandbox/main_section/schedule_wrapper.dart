import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleWrapper extends StatelessWidget {
  double height;
  ScheduleWrapper(this.height);

  var scrollController = new ScrollController();
  void _broadcastScrollPosition(
    UIEventsProvider uiEvents,
  ) {
    if (scrollController.offset != uiEvents.horizontalScrollPosition) {
      uiEvents.updateScrollPosition(scrollController.offset);
      print(
          "ScheduleWrapper current offset: ${scrollController.offset}, ui offset: ${uiEvents.horizontalScrollPosition}");
    } else {
      print('ignored broadcast event');
    }
  }

  _updateScrollPosition(double val) {
    scrollController.jumpTo(val);
  }

  @override
  Widget build(BuildContext context) {
    var uiProvider = Provider.of<UIEventsProvider>(context, listen: false);

    print("Height: " + MediaQuery.of(context).size.height.toString());

    uiProvider.addListener(
        () => _updateScrollPosition(uiProvider.horizontalScrollPosition));
    scrollController.addListener(() => _broadcastScrollPosition(uiProvider));

    return Flexible(
      child: SingleChildScrollView(
        child: Container(
          child: Placeholder(color: Colors.green),
          width: 3000,
        ),
        scrollDirection: Axis.horizontal,
        controller: scrollController,
      ),
    );
  }
}
