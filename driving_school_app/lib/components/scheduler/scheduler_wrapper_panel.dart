import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../../constants/colors.dart';
import '../../models/instructor.dart';
import '../../models/scheduler_dimensions.dart';
import 'footer.dart';
import 'main_panel.dart';
import 'avatar_wrapper.dart';
import 'right_scroll_bar.dart';
import 'header.dart';

class SchedulerWrapperPanel extends StatefulWidget {
  final List<Instructor> _instructors;

  const SchedulerWrapperPanel(this._instructors);

  @override
  _SchedulerWrapperPanelState createState() =>
      _SchedulerWrapperPanelState(_instructors);
}

class _SchedulerWrapperPanelState extends State<SchedulerWrapperPanel> {
  LinkedScrollControllerGroup _horizontalControllers;
  LinkedScrollControllerGroup _verticalControllers;
  ScrollController _topBarHorizontalController;
  ScrollController _middleSwimlaneHorizontalController;
  ScrollController _bottomBarHorizontalController;
  ScrollController _leftBarVerticalController;
  ScrollController _middleSwimlaneVerticalController;
  ScrollController _rightBarVerticalController;
  List<Instructor> _instructors;

  @override
  void initState() {
    super.initState();
    _horizontalControllers = LinkedScrollControllerGroup();
    _verticalControllers = LinkedScrollControllerGroup();
    /**
     * Horizontal Controllers
     */
    _topBarHorizontalController = _horizontalControllers.addAndGet();
    _middleSwimlaneHorizontalController = _horizontalControllers.addAndGet();
    _bottomBarHorizontalController = _horizontalControllers.addAndGet();
    /**
     * Vertical Controllers
     */
    _leftBarVerticalController = _verticalControllers.addAndGet();
    _middleSwimlaneVerticalController = _verticalControllers.addAndGet();
    _rightBarVerticalController = _verticalControllers.addAndGet();
  }

  @override
  void dispose() {
    _topBarHorizontalController.dispose();
    _middleSwimlaneHorizontalController.dispose();
    _bottomBarHorizontalController.dispose();
    _leftBarVerticalController.dispose();
    _middleSwimlaneVerticalController.dispose();
    _rightBarVerticalController.dispose();
    super.dispose();
  }

  _SchedulerWrapperPanelState(this._instructors);

  double fullSwimlaneHeight(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    return _instructors.length * schedulerDimensions.cardHeight +
        (schedulerDimensions.cardSeparatorHeight * (_instructors.length + 1));
  }

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    var swimlaneHeight = fullSwimlaneHeight(context);

    return Container(
      width: schedulerDimensions.outerWidth,
      height: schedulerDimensions.outerHeight,
      color: AppColors.GreyLight,
      child: Column(
        children: [
          Header(_topBarHorizontalController),
          SizedBox(
            child: Row(
              children: [
                LeftAvatarWrapper(
                  schedulerDimensions.middlePanelHeight,
                  schedulerDimensions.leftPanelWidth,
                  _leftBarVerticalController,
                ),
                MainPanel(
                  _middleSwimlaneVerticalController,
                  _middleSwimlaneHorizontalController,
                  swimlaneHeight,
                  _instructors,
                ),
                RightScrollBar(
                  _rightBarVerticalController,
                  swimlaneHeight,
                ),
              ],
            ),
            height: schedulerDimensions.middlePanelHeight,
          ),
          Footer(this._bottomBarHorizontalController)
        ],
      ),
    );
  }
}
