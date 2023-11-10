// import 'package:driving_school_app/config/config.dev.dart';
// import 'package:driving_school_app/models/instructor.dart';
// import 'package:flutter/material.dart';

// class SchedulerDimensions {
//   late double outerWidth;
//   late double outerHeight;
//   late double cardWidth;
//   late double cardHeight;
//   late double swimLaneWidth;
//   late double leftPanelWidth;
//   late double rightPanelWidth;
//   late double middlePanelWidth;
//   late double topPaneHeight;
//   late double middlePanelHeight;
//   late double bottomPanelHeight;
//   late double cardSeparatorHeight;
//   late int totalHours;

//   SchedulerDimensions(BuildContext context) {
//     this.totalHours = GlobalConfig['app']['tradingHours']['count'];
//     var size = MediaQuery.of(context).size;
//     this.outerWidth = size.width * 0.85;
//     this.outerHeight = size.height * 0.85;
//     this.cardWidth = size.width * 0.08;
//     this.cardHeight = outerHeight * 0.15;
//     this.swimLaneWidth = this.cardWidth * this.totalHours;
//     this.leftPanelWidth = this.outerWidth * 0.13;
//     this.rightPanelWidth = this.outerWidth * 0.04;
//     this.middlePanelWidth =
//         this.outerWidth - (this.leftPanelWidth + this.rightPanelWidth);
//     this.topPaneHeight = this.outerHeight * 0.05;
//     this.middlePanelHeight = this.outerHeight * 0.90;
//     this.bottomPanelHeight = this.outerHeight * 0.05;
//     this.cardSeparatorHeight = size.height * 0.01;
//   }

//   static double fullSwimlaneHeight(int count, BuildContext context) {
//     var schedulerDimensions = SchedulerDimensions(context);
//     return count * schedulerDimensions.cardHeight +
//         (schedulerDimensions.cardSeparatorHeight * (count + 1));
//   }
// }

import 'package:flutter/material.dart';

double _leftSideBarRatio = .13;
double _rightSideBarRatio = .04;
double _topPanelHeightRatio = .05;
double _bottomPanelHeightRatio = .05;

class SchedulerDimensions extends InheritedWidget {
  final Size blockSize;
  final BoxConstraints constraints;
  final int totalHours;

  const SchedulerDimensions({required this.blockSize, required this.totalHours, required this.constraints, super.key, required super.child});

  double get leftPanelWidth => constraints.maxWidth * _leftSideBarRatio;

  double get rightPanelWidth => constraints.maxWidth * _rightSideBarRatio;

  double get innerWidth => constraints.maxWidth - (leftPanelWidth + rightPanelWidth);

  double get topPanelHeight => constraints.maxHeight * _topPanelHeightRatio;

  double get bottomPanelHeight => constraints.maxHeight * _bottomPanelHeightRatio;

  double get innerHeight => constraints.maxHeight - (topPanelHeight + bottomPanelHeight);

  static SchedulerDimensions? _maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SchedulerDimensions>();
  }

  static SchedulerDimensions of(BuildContext context) {
    final SchedulerDimensions? result = _maybeOf(context);
    assert(result != null, 'No Dimensions found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant SchedulerDimensions oldWidget) {
    return oldWidget.blockSize.height != this.blockSize.height && oldWidget.blockSize.width != this.blockSize.width;
  }

  double get preferredInnerHeight => (innerHeight / blockSize.height).floor() * blockSize.height;

  double get preferredInnerWidth => (innerWidth / blockSize.width).floor() * blockSize.width;

  // double get fullSwimlaneWidth => totalHours * blockSize.width
}
