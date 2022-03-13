// import 'package:driving_school_app/core_widgets/base_app_widget.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/utilities/config_helper.dart';
import 'package:flutter/material.dart';

class GuideLines extends StatelessWidget {
  final List<Instructor> instructors;
  final double height;

  final double cardWidth;
  GuideLines({this.cardWidth, this.height, this.instructors});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          children: instructors
              .map(
                (instructor) => Container(
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
              )
              .toList()),
      height: height,
    );
  }
}
