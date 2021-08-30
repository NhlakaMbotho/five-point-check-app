import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RightScrollBar extends StatelessWidget {
  final ScrollController _localController = ScrollController();
  final double itemHeight;
  RightScrollBar(this.itemHeight);

  calcHeight(context) {
    var length =
        Provider.of<InstructorProvider>(context, listen: false).getAll().length;
    return (length * 100) + (10 * length - 1);
  }

  syncController(context) {
    var verticalScroll = Provider.of<UIEventsProvider>(context, listen: true)
        .sharedVerticalController;

    verticalScroll.addListener(() {
      if (_localController.hasClients &&
          _localController.offset != verticalScroll.offset &&
          !verticalScroll.position.outOfRange) {
        _localController.jumpTo(verticalScroll.offset);
      }
    });

    _localController.addListener(() {
      if (verticalScroll.hasClients &&
          verticalScroll.offset != _localController.offset &&
          !_localController.position.outOfRange) {
        verticalScroll.jumpTo(_localController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _height = calcHeight(context);

    syncController(context);

    return Container(
      width: 20,
      height: itemHeight,
      child: RawScrollbar(
        controller: _localController,
        isAlwaysShown: true,
        thickness: 9,
        radius: Radius.circular(5),
        thumbColor: Color(0xFFe6e6e6),
        child: SingleChildScrollView(
          child: Container(
            height: _height,
            width: 9,
          ),
          scrollDirection: Axis.vertical,
          controller: _localController,
        ),
      ),
    );
  }
}
