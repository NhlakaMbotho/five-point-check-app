import 'package:driving_school_app/components/final_scheduler.dart';
import 'package:driving_school_app/components/scheduler/main_header.dart';
import 'package:driving_school_app/components/scheduler/scheduler_wrapper_panel.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: MainAppBar('Dashboard'),
      backgroundColor: AppColors.GreyLight,
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: SchedulerWidget(
          blockHeight: MediaQuery.of(context).size.height * 0.11,
          blockWidth: MediaQuery.of(context).size.width * 0.08,
        ),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Container(
      //       color: AppColors.GreyLight,
      //       height: size.height,
      //       width: size.width,
      //       child: SchedulerWrapperPanel(Provider.of<InstructorProvider>(context).getAll()),
      //     ),
      //   ],
      // ),
    );
  }
}
