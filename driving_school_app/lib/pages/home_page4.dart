import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/sandbox/footer_section/footer_section.dart';
import 'package:driving_school_app/sandbox/header_section/header_section.dart';
import 'package:driving_school_app/sandbox/main_section/avatar_wrapper.dart';
import 'package:driving_school_app/sandbox/main_section/right_scroll_bar.dart';
import 'package:driving_school_app/sandbox/main_section/schedule_wrapper.dart';
import '../providers/ui_events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: Container(
        child: Column(
          children: [
            HeaderSection(),
            MainSection(),
            FooterSection(),
          ],
        ),
        padding: EdgeInsets.all(4.0),
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
          border: Border.all(
            color: Colors.red,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
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

class MainSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var uiProvider = Provider.of<UIEventsProvider>(context, listen: true);

    double rowHeight = 430;
    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Row(
        children: [
          AvatarWrapper(rowHeight),
          ScheduleWrapper(rowHeight),
          RightScrollBar(rowHeight),
        ],
      ),
    );
  }
}
