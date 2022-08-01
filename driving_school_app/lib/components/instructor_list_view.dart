import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'instructor_list.dart';
import 'table_header.dart';

class InstructorListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableHeader(UserType.INSTRUCTOR),
        Expanded(
          flex: 4,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            borderOnForeground: false,
            elevation: 0,
            color: Colors.white,
            child: InstructorList(),
          ),
        ),
      ],
    );
  }
}
