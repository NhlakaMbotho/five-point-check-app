import 'dart:html';
import 'package:driving_school_app/config/config.dev.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:driving_school_app/pages/top_component.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/sandbox/main_section/avatar_wrapper.dart';
import 'package:driving_school_app/sandbox/main_section/scheduler/guideline_list.dart';
import 'package:flutter/gestures.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import '../providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_swim_lane.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var instructors =
        Provider.of<InstructorProvider>(context, listen: false).getAll();
    return MultiProvider(
      child: Container(
        child: Center(child: MainSchedulerPanel(instructors)),
      ),
      providers: [
        ListenableProvider(
          create: (_) => InstructorProvider(),
        ),
      ],
    );
  }
}

class MainSchedulerPanel extends StatefulWidget {
  final List<Instructor> _instructors;

  const MainSchedulerPanel(this._instructors);

  @override
  _MainSchedulerPanelState createState() =>
      _MainSchedulerPanelState(_instructors);
}

class _MainSchedulerPanelState extends State<MainSchedulerPanel> {
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

  _MainSchedulerPanelState(this._instructors);

  double fullSwimlaneHeight(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    return _instructors.length * schedulerDimensions.cardHeight +
        (schedulerDimensions.cardSeparatorHeight * (_instructors.length + 1));
  }

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    print(
        'height: ${schedulerDimensions.middlePanelHeight} outer height: ${schedulerDimensions.outerHeight}');
    var swimlaneHeight = fullSwimlaneHeight(context);

    print('inner height: ${swimlaneHeight}');

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
