import 'package:driving_school_app/core_widgets/base_app_widget.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FooterSection extends StatelessWidget with BaseAppWidget {
  final ScrollController _localController = ScrollController();

  syncController(context) {
    var horizontalScroll = Provider.of<UIEventsProvider>(context, listen: true)
        .sharedHorizontalController;

    horizontalScroll.addListener(() {
      if (_localController.hasClients &&
          _localController.offset != horizontalScroll.offset &&
          !horizontalScroll.position.outOfRange) {
        _localController.jumpTo(horizontalScroll.offset);
      }
    });

    _localController.addListener(() {
      if (horizontalScroll.hasClients &&
          horizontalScroll.offset != _localController.offset &&
          !_localController.position.outOfRange) {
        horizontalScroll.jumpTo(_localController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _height = 12.0;
    var dimensions = getConfigValue(["dimensions", "compoments", "scheduler"]);

    syncController(context);

    return Container(
      height: _height,
      margin: EdgeInsets.only(
        left: 100,
        top: 10,
        right: 22,
      ),
      child: RawScrollbar(
        controller: _localController,
        isAlwaysShown: true,
        thickness: _height,
        radius: Radius.circular(5),
        thumbColor: Colors.grey.withOpacity(.1),
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.lightBlue,
            height: _height,
            width: dimensions["mainWidth"] as double,
          ),
          scrollDirection: Axis.horizontal,
          controller: _localController,
        ),
      ),
    );
  }
}
