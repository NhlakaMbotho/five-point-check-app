import 'package:driving_school_app/components/scheduler/avatar_wrapper.dart';
import 'package:driving_school_app/components/scheduler/footer.dart';
import 'package:driving_school_app/components/scheduler/header.dart';
import 'package:driving_school_app/components/scheduler/main_panel.dart';
import 'package:driving_school_app/components/scheduler/right_scroll_bar.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/models/scheduler_dimensions.dart';
import 'package:driving_school_app/providers/scroll_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class SchedulerWidget extends StatelessWidget {
  final double blockWidth;
  final double blockHeight;
  SchedulerWidget({
    required this.blockWidth,
    required this.blockHeight,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SchedulerDimensions(
          blockSize: Size(blockWidth, blockHeight),
          constraints: constraints,
          child: Provider(
      create: (context) => ScrollEventsProvider(),
      child: Container(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        decoration: BoxDecoration(
          color: AppColors.GreyLight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(
              child: Row(
                children: [
                  LeftAvatarWrapper(),
                  MainPanel(
                    cardWidth: blockWidth,
                  ),
                  RightScrollBar(),
                ],
              ),
              height: SchedulerDimensions.of(context).preferredInnerHeight,
            ),
            Footer()
          ],
        ),
      ),
    );,
        );
      },
    );
  }
}

