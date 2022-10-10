import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';
import '../components/instructor_list.dart';
import '../components/scheduler/main_header.dart';
import '../components/table_header.dart';

class InstructorsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return Scaffold(
      appBar: MainAppBar('Instructors'),
      body: Row(
        children: [
          Expanded(
            child: Column(
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
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.GreyLight,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => tabsRouter.setActiveIndex(1),
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
