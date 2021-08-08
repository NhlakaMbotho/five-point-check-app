import 'package:driving_school_app/core_widgets/base_app_widget.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class FooterSection extends StatelessWidget with BaseAppWidget {
  final ScrollController _localController = ScrollController();

  syncController(context) {
    // var horizontalScroll = Provider.of<UIEventsProvider>(context, listen: true)
    //     .sharedHorizontalController;

    // horizontalScroll.addListener(() {
    //   if (_localController.hasClients &&
    //       _localController.offset != horizontalScroll.offset &&
    //       !horizontalScroll.position.outOfRange) {
    //     _localController.jumpTo(horizontalScroll.offset);
    //   }
    // });

    // _localController.addListener(() {
    //   if (horizontalScroll.hasClients &&
    //       horizontalScroll.offset != _localController.offset &&
    //       !_localController.position.outOfRange) {
    //     horizontalScroll.jumpTo(_localController.offset);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = getDimensions(["dimensions", "compoments", "scheduler"]);

    syncController(context);

    return Container(
      height: 12,
      width: 600,
      margin: EdgeInsets.only(top: 9),
      child: RawScrollbar(
        controller: _localController,
        isAlwaysShown: true,
        thickness: 12,
        radius: Radius.circular(5),
        thumbColor: Colors.grey.withOpacity(.1),
        child: SingleChildScrollView(
          child: Container(
            width: 3000,
            color: Colors.lightBlue,
          ),
          scrollDirection: Axis.horizontal,
          controller: _localController,
        ),
      ),
      padding: EdgeInsets.only(
        left: dimensions["leftSideBar"] as double,
        right: dimensions["rightSideBar"] as double,
      ),
    );
  }
}
