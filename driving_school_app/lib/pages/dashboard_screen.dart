import 'package:driving_school_app/components/scheduler/scheduler_wrapper_panel.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SchedulerWrapperPanel(
          Provider.of<InstructorProvider>(context).getAll()),
    );
  }
}
