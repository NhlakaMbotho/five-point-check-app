import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AvatarWrapper extends StatelessWidget {
  final ScrollController _localController = new ScrollController();
  final double height;
  final ScrollPhysics physics = BouncingScrollPhysics();

  AvatarWrapper(this.height);

  syncController(context) {
    var vertcicallScroll = Provider.of<UIEventsProvider>(context, listen: true)
        .sharedVerticalController;

    vertcicallScroll.addListener(() {
      if (_localController.hasClients &&
          _localController.offset != vertcicallScroll.offset &&
          !vertcicallScroll.position.outOfRange) {
        _localController.jumpTo(vertcicallScroll.offset);
      }
    });

    _localController.addListener(() {
      if (vertcicallScroll.hasClients &&
          vertcicallScroll.offset != _localController.offset &&
          !_localController.position.outOfRange) {
        vertcicallScroll.jumpTo(_localController.offset);
      }
    });
  }

  getInstructors(context) =>
      Provider.of<InstructorProvider>(context, listen: false).getAll();

  @override
  Widget build(BuildContext context) {
    syncController(context);
    var instructors = getInstructors(context);

    return Container(
      child: ListView.separated(
        itemBuilder: (BuildContext ctx, int index) =>
            InstructorWidget(instructors[index]),
        separatorBuilder: (BuildContext ctx, int index) {
          return Container(
            height: 10,
          );
        },
        itemCount: instructors.length,
        controller: _localController,
      ),
      height: height,
      width: 100,
    );
  }
}

class InstructorWidget extends StatelessWidget {
  final Instructor insrtuctor;
  InstructorWidget(this.insrtuctor);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 80,
            child: Center(
              child: Image(
                image: this.insrtuctor.image.image,
                height: 70,
              ),
            ),
          ),
          Container(
            height: 20,
            child: Center(
              child: Text(
                this.insrtuctor.name,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
