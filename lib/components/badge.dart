import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String value;
  final bool primary;
  Badge(String value, {bool primary = false})
      : value = value,
        primary = primary;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            color: primary ? Colors.white : AppColors.Dark,
          ),
        ),
      ),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: primary ? AppColors.Primary : AppColors.GreyLight,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
