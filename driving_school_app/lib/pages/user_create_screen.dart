import 'package:driving_school_app/components/user_form.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';

class UserCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.GreyDark,
      body: Card(
        child: UserForm(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
        ),
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        borderOnForeground: false,
        elevation: 10,
        color: Colors.white,
      ),
    );
  }
}
