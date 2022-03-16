import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/scheduler/scheduler_wrapper_panel.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var instructors =
        Provider.of<InstructorProvider>(context, listen: false).getAll();
    return MultiProvider(
      child: Container(
        child: Center(child: SchedulerWrapperPanel(instructors)),
      ),
      providers: [
        ListenableProvider(
          create: (_) => InstructorProvider(),
        ),
      ],
    );
  }
}
