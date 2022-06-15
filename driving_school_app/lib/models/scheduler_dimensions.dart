import 'package:driving_school_app/config/config.dev.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:flutter/material.dart';

class SchedulerDimensions {
  late double outerWidth;
  late double outerHeight;
  late double cardWidth;
  late double cardHeight;
  late double swimLaneWidth;
  late double leftPanelWidth;
  late double rightPanelWidth;
  late double middlePanelWidth;
  late double topPaneHeight;
  late double middlePanelHeight;
  late double bottomPanelHeight;
  late double cardSeparatorHeight;
  late int totalHours;

  SchedulerDimensions(BuildContext context) {
    this.totalHours = GlobalConfig['app']['tradingHours']['count'];
    var size = MediaQuery.of(context).size;
    this.outerWidth = size.width * 0.70;
    this.outerHeight = size.height * 0.70;
    this.cardWidth = size.width * 0.08;
    this.cardHeight = outerHeight * 0.15;
    this.swimLaneWidth = this.cardWidth * this.totalHours;
    this.leftPanelWidth = this.outerWidth * 0.13;
    this.rightPanelWidth = this.outerWidth * 0.04;
    this.middlePanelWidth =
        this.outerWidth - (this.leftPanelWidth + this.rightPanelWidth);
    this.topPaneHeight = this.outerHeight * 0.05;
    this.middlePanelHeight = this.outerHeight * 0.90;
    this.bottomPanelHeight = this.outerHeight * 0.05;
    this.cardSeparatorHeight = size.height * 0.01;
  }

  static double fullSwimlaneHeight(int count, BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    return count * schedulerDimensions.cardHeight +
        (schedulerDimensions.cardSeparatorHeight * (count + 1));
  }
}
