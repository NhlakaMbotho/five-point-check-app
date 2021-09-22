import 'dart:ui';

import 'package:driving_school_app/core_widgets/base_app_widget.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderSection extends StatelessWidget with BaseAppWidget {
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

  List<Instructor> getInstructors(context) =>
      Provider.of<InstructorProvider>(context, listen: false).getAll();

  List<Widget> getTimestamps(context) {
    var hours = getConfigValue(["timestamps"]) as int;
    var cardWidth =
        getConfigValue(["dimensions", "compoments", "scheduler", "cardWidth"])
            as double;

    const HOUR_OFFSET = 7;
    List<Widget> list = [];
    var tradingHours = {"start": 7, "end": 16};
    for (var i = tradingHours["start"];
        i < hours && i <= tradingHours["end"];
        i++) {
      String hourText = (i < 10 ? '0' : '').toString() + i.toString() + ':00';
      list.add(
        Container(
          color: Colors.transparent,
          width: cardWidth,
          child: Row(
            children: [
              Container(
                width: 60,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(10)),
                  color: Color(0xFF00B7CF),
                ),
                child: Center(
                  child: Text(
                    hourText,
                    style: TextStyle(
                      fontSize: 10,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    syncController(context);

    return Container(
      height: 20,
      margin: EdgeInsets.only(
        left: 100,
        right: 22,
      ),
      child: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Row(
              children: getTimestamps(context),
            ),
            width: getWidth(),
          ),
          scrollDirection: Axis.horizontal,
          controller: _localController,
        ),
      ),
    );
  }
}
