import 'package:driving_school_app/config/config.dev.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:driving_school_app/providers/scroll_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchedulerTimeStamp extends StatelessWidget {
  final int hour;
  SchedulerTimeStamp(this.hour);

  formatHour(int value) {
    return value < 10 ? '0$value:00' : '$value:00';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.Primary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(6.0),
              ),
            ),
            height: constraints.maxHeight * 0.6,
            width: constraints.maxWidth * 0.4,
            child: Center(
              child: Text(
                '${formatHour(hour)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 7,
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          )
        ],
      );
    }));
  }
}

class Header extends StatelessWidget {
  final int count = GlobalConfig['app']['tradingHours']['count'];
  final int startHour = GlobalConfig['app']['tradingHours']['start'];
  final ScrollController controller = ScrollController();

  Header();

  @override
  Widget build(BuildContext context) {
    var dimensions = SchedulerDimensions.of(context);
    Provider.of<ScrollEventsProvider>(context).attachHorizontalScrollOutput(controller);
    return Container(
      child: ListView.separated(
        itemBuilder: (_, index) => SizedBox(
          child: SchedulerTimeStamp(startHour + index),
          width: dimensions.blockSize.width,
          height: dimensions.topPanelHeight,
        ),
        separatorBuilder: (_, index) => Divider(),
        itemCount: count,
        controller: controller,
        scrollDirection: Axis.horizontal,
      ),
      height: dimensions.topPanelHeight,
      width: dimensions.preferredInnerWidth,
      margin: EdgeInsets.only(
        left: dimensions.leftPanelWidth,
        right: dimensions.rightPanelWidth,
      ),
    );
  }
}
