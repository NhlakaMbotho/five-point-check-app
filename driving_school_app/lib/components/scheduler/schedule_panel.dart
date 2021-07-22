import 'package:driving_school_app/components/scheduler/swimlane.dart';
import 'package:flutter/material.dart';

import 'time_guide_lines.dart';

class SwimlanePanel extends StatelessWidget {
  final double swimlaneHeight = 140;

  final int lanes;

  SwimlanePanel(this.lanes);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GuidePainter(),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.separated(
            itemBuilder: (_, index) => Swimlane(this.swimlaneHeight, index),
            separatorBuilder: (_, index) => Divider(
                  color: Color(0xFFF8F7F7),
                ),
            itemCount: lanes),
      ),
    );
  }
}
