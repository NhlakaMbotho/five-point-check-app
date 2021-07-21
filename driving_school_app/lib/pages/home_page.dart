import 'package:driving_school_app/components/scheduler/schedule_panel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 600,
          width: 1000,
          child: SwimlanePanel(4),
          decoration: BoxDecoration(color: Color(0xFFF8F7F7)),
        ),
      ),
    );
  }
}
