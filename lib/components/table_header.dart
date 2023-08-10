import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'instructor_list.dart';

class TableHeader extends StatelessWidget {
  final UserType _type;
  const TableHeader(UserType type) : _type = type;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _type == UserType.CLIENT
            ? [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(flex: 2, child: RowText('Full Name')),
                Expanded(flex: 2, child: RowText('Phone')),
                Expanded(flex: 2, child: Center(child: RowText('Progress'))),
                Expanded(flex: 2, child: Center(child: RowText('Code'))),
                Expanded(
                    flex: 2, child: Center(child: RowText('Taken Lessons'))),
                Expanded(
                    flex: 2,
                    child: Center(child: RowText('Remaining Lessons'))),
              ]
            : [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(flex: 2, child: RowText('Full Name')),
                Expanded(flex: 2, child: RowText('Phone')),
                Expanded(flex: 2, child: Center(child: RowText('Status'))),
                Expanded(
                    flex: 2, child: Center(child: RowText('Planned Lessons'))),
                Expanded(flex: 2, child: Center(child: RowText('Total Hours'))),
                Expanded(flex: 2, child: Center(child: RowText('Av. Rating'))),
              ],
      ),
    );
  }
}
