import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../../constants/colors.dart';
import '../../models/instructor.dart';
import '../../models/scheduler_dimensions.dart';
import 'main_panel.dart';
import 'avatar_wrapper.dart';
import 'top_component.dart';

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
          Container(
            child: TopComponent(_topBarHorizontalController),
            height: schedulerDimensions.topPaneHeight,
            margin: EdgeInsets.only(
              left: schedulerDimensions.leftPanelWidth,
              right: schedulerDimensions.rightPanelWidth,
            ),
          ),
          SizedBox(
            child: Row(
              children: [
                SizedBox(
                  child: AvatarWrapper(
                    schedulerDimensions.middlePanelHeight,
                    schedulerDimensions.leftPanelWidth,
                    _leftBarVerticalController,
                  ),
                  width: schedulerDimensions.leftPanelWidth,
                  height: schedulerDimensions.middlePanelHeight,
                ),
                SizedBox(
                  width: schedulerDimensions.middlePanelWidth,
                  child: SingleChildScrollView(
                    child: MainPanel(
                      _middleSwimlaneVerticalController,
                      swimlaneHeight,
                      _instructors,
                    ),
                    scrollDirection: Axis.horizontal,
                    dragStartBehavior: DragStartBehavior.down,
                    controller: _middleSwimlaneHorizontalController,
                  ),
                  height: schedulerDimensions.middlePanelHeight,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    child: Placeholder(
                      color: Colors.grey,
                      fallbackHeight: swimlaneHeight,
                    ),
                    height: swimlaneHeight,
                    width: schedulerDimensions.rightPanelWidth,
                  ),
                  controller: _rightBarVerticalController,
                ),
              ],
            ),
            height: schedulerDimensions.middlePanelHeight,
          ),
          Container(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Placeholder(
                  fallbackWidth: schedulerDimensions.swimLaneWidth,
                  color: Colors.pink,
                ),
                scrollDirection: Axis.horizontal,
                controller: _bottomBarHorizontalController,
              ),
              height: schedulerDimensions.bottomPanelHeight,
              width: schedulerDimensions.middlePanelWidth,
            ),
            margin: EdgeInsets.only(
              left: schedulerDimensions.leftPanelWidth,
              right: schedulerDimensions.rightPanelWidth,
            ),
          )
        ],
      ),
    );
  }
}
