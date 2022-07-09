import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/pages/accounts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Badge extends StatelessWidget {
  final String value;
  Badge(String value) : value = value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        value,
        style: TextStyle(
          color: AppColors.Dark,
        ),
      )),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.GreyLight,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
