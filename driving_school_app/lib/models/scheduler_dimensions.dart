import 'package:driving_school_app/config/config.dev.dart';
import 'package:flutter/material.dart';

class SchedulerDimensions {
  double outerWidth;
  double outerHeight;
  double cardWidth;
  double cardHeight;
  double swimLaneWidth;
  double leftPanelWidth;
  double rightPanelWidth;
  double middlePanelWidth;
  double topPaneHeight;
  double middlePanelHeight;
  double bottomPanelHeight;

  SchedulerDimensions(BuildContext context) {
    var totalHours = GlobalConfig['app']['tradingHours']['count'];
    var size = MediaQuery.of(context).size;
    this.outerWidth = size.width * 0.70;
    this.outerHeight = size.height * 0.70;
    this.cardWidth = size.width * 0.10;
    this.cardHeight = outerHeight * 0.20;
    this.swimLaneWidth = this.cardWidth * totalHours;
    print(
        'card width: ${this.swimLaneWidth}, fwith: ${this.swimLaneWidth / this.cardWidth}');
    this.leftPanelWidth = this.outerWidth * 0.18;
    this.rightPanelWidth = this.outerWidth * 0.04;
    this.middlePanelWidth =
        this.outerWidth - (this.leftPanelWidth + this.rightPanelWidth);
    this.topPaneHeight = this.outerHeight * 0.05;
    this.middlePanelHeight = this.outerHeight * 0.90;
    this.bottomPanelHeight = this.outerHeight * 0.05;
  }
}
