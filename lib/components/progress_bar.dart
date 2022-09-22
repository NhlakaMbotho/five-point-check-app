import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ProgressBar extends StatelessWidget {
  final double percentage;
  ProgressBar(double percentage) : percentage = percentage;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var radius = const Radius.circular(18);
      return Container(
        height: 30,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: AppColors.GreyDark,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: constraints.maxWidth * (percentage / 100),
              decoration: BoxDecoration(
                  color: AppColors.Primary,
                  borderRadius: BorderRadius.only(
                    topLeft: radius,
                    bottomLeft: radius,
                  )),
            ),
          ],
        ),
      );
    });
  }
}
