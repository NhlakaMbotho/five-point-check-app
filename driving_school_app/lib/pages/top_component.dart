import 'dart:ui';

import 'package:driving_school_app/config/config.dev.dart';
import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:flutter/material.dart';

class SchedulerTimeStamp extends StatelessWidget {
  final int hour;
  SchedulerTimeStamp(this.hour);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '$hour',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      decoration: BoxDecoration(color: Colors.green),
    );
  }
}

class TopComponent extends StatelessWidget {
  final int count = GlobalConfig['app']['tradingHours']['count'];
  final int startHour = GlobalConfig['app']['tradingHours']['start'];
  ScrollController controller;

  TopComponent(this.controller);

  @override
  Widget build(BuildContext context) {
    var dimensions = SchedulerDimensions(context);
    return ListView.separated(
      itemBuilder: (_, index) => SizedBox(
        child: SchedulerTimeStamp(startHour + index),
        width: dimensions.cardWidth,
      ),
      separatorBuilder: (_, index) => Divider(),
      itemCount: count,
      controller: controller,
      scrollDirection: Axis.horizontal,
    );
  }
}
