import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';
import '../components/instructor_list_view.dart';

class InstructorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: [
          Expanded(
            child: InstructorListView(),
          ),
        ],
      )),
      backgroundColor: AppColors.GreyLight,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => print('Awe!'),
        backgroundColor: AppColors.Primary,
        foregroundColor: Colors.white,
        elevation: 12,
        focusElevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text('+'),
      ),
    );
  }
}
