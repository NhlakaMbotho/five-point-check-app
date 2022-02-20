import 'package:driving_school_app/config/config.dev.dart';
import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:driving_school_app/pages/top_component.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/sandbox/main_section/avatar_wrapper.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import '../providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: Container(
        child: Center(child: MainSchedulerPanel()),
      ),
      providers: [
        ListenableProvider(
          create: (_) => UIEventsProvider(),
        ),
        ListenableProvider(
          create: (_) => InstructorProvider(),
        ),
      ],
    );
  }
}

class MainSchedulerPanel extends StatefulWidget {
  const MainSchedulerPanel();

  @override
  _MainSchedulerPanelState createState() => _MainSchedulerPanelState();
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

  @override
  Widget build(BuildContext context) {
    var schedulerDimensions = SchedulerDimensions(context);
    print(
        'height: ${schedulerDimensions.middlePanelHeight} outer height: ${schedulerDimensions.outerHeight}');

    return Container(
      width: schedulerDimensions.outerWidth,
      height: schedulerDimensions.outerHeight,
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
                    child: SingleChildScrollView(
                      child: Placeholder(
                        color: Colors.orange,
                        fallbackWidth: schedulerDimensions.swimLaneWidth,
                        fallbackHeight: 1000,
                      ),
                      controller: _middleSwimlaneVerticalController,
                    ),
                    scrollDirection: Axis.horizontal,
                    controller: _middleSwimlaneHorizontalController,
                  ),
                  height: schedulerDimensions.middlePanelHeight,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    child: Placeholder(color: Colors.blue),
                    height: 1000,
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
