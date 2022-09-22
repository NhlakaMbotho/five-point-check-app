import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/routes/router.gr.dart';
import 'package:flutter/material.dart';

class InstructorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        InstructorsListRoute(),
        UserCreateRoute(),
      ],
      homeIndex: 0,
    );
  }
}
