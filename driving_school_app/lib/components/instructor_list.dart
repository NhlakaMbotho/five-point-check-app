import 'package:driving_school_app/components/rating.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'badge.dart';
import 'status.dart';

class RowText extends Text {
  const RowText(String text)
      : super(text,
            style: const TextStyle(fontSize: 12, color: AppColors.Dark));
}

class InstructorRow extends StatelessWidget {
  formatNumber(String number) {
    if (number.length == 10) {
      return '(${number.substring(0, 3)}) ${number.substring(3, 6)}-${number.substring(6, 10)}';
    }
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(6), // Border radius
              child: ClipOval(
                child: Image(
                    image: AssetImage("./images/user.png"), fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Expanded(flex: 2, child: RowText('Nhlakanipho Mbotho')),
        Expanded(flex: 2, child: RowText(formatNumber('0814062334'))),
        Flexible(
          flex: 2,
          child: Center(child: StatusWidget(AvailabilityStatus.AVAILABLE)),
        ),
        Expanded(flex: 2, child: Center(child: Badge('34'))),
        Expanded(flex: 2, child: Center(child: Badge('12'))),
        Expanded(flex: 2, child: Center(child: Rating(2))),
      ],
    );
  }
}

class InstructorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return SizedBox(
            child: InstructorRow(),
            height: 60,
          );
        }),
        separatorBuilder: (context, index) =>
            Divider(color: AppColors.GreyDark, height: 6),
        itemCount: 14);
  }
}
