import 'package:driving_school_app/core_widgets/base_app_widget.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderSection extends StatelessWidget with BaseAppWidget {
  // ScrollController localScroller = new ScrollController();

  // _syncScrollConrtoller(UIEventsProvider uiEvents) {
  //   uiEvents.addListener(
  //     () => localScroller.jumpTo(uiEvents.horizontalScrollPosition),
  //   );

  //   localScroller.addListener(
  //     () => _broadcastScrollPosition(uiEvents),
  //   );
  // }

  // void _broadcastScrollPosition(
  //   UIEventsProvider uiEvents,
  // ) {
  //   if (localScroller.offset != uiEvents.horizontalScrollPosition) {
  //     uiEvents.updateScrollPosition(localScroller.offset);
  //     print(
  //         "HeaderSection current offset: ${localScroller.offset}, ui offset: ${uiEvents.horizontalScrollPosition}");
  //   } else {
  //     print('ignored broadcast event');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var dimensions = getDimensions(["dimensions", "compoments", "scheduler"]);
    var uiProvider = Provider.of<UIEventsProvider>(context, listen: false);

    // _syncScrollConrtoller(uiProvider);

    return Container(
      height: 40,
      margin: EdgeInsets.only(
        left: 100,
        right: 22,
      ),
      child: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Placeholder(),
            width: dimensions["mainWidth"] as double,
          ),
          scrollDirection: Axis.horizontal,
          controller: null,
        ),
      ),
    );
  }
}
