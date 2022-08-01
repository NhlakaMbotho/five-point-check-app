import 'package:driving_school_app/components/user_form.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';

class UserCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.GreyLight,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              width: constraints.maxWidth / 1.6,
              padding: const EdgeInsets.all(40),
              child: Card(
                child: UserForm(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                borderOnForeground: false,
                elevation: 140,
                shadowColor: Colors.grey.withOpacity(.1),
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
