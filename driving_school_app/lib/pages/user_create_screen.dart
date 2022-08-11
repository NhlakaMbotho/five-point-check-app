import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/components/user_form.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../models/user_create.dart';

class Step extends StatelessWidget {
  final String sequenceNo;
  final void Function() stepHandler;
  Step(String sequenceNo, void Function() stepHandler)
      : sequenceNo = sequenceNo,
        stepHandler = stepHandler {}
  @override
  Widget build(BuildContext context) {
    double radius = 60.0;
    return GestureDetector(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.Primary,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            sequenceNo,
            style: TextStyle(color: AppColors.Primary, fontSize: 20),
          ),
        ),
      ),
      onTap: stepHandler,
    );
  }
}

class UserCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var router = AutoTabsRouter.of(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 150),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Step('1', () => {}),
                      Step('2', () => {}),
                      Step('3', () => {}),
                    ],
                  ),
                ),
                width: constraints.maxWidth * .2,
                height: double.infinity,
              ),
              Container(
                width: constraints.maxWidth / 1.6,
                padding: const EdgeInsets.all(40),
                child: Center(
                  child: Card(
                    child: UserForm(
                      title: 'Register Instructor',
                      isEdit: false,
                      saveHandler: saveChanges,
                      backHandler: () =>
                          router.setActiveIndex(router.previousIndex ?? 0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    borderOnForeground: false,
                    shadowColor: Colors.grey.withOpacity(.1),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  saveChanges(UserCreateModel user) {
    print('user to be saved $user');
  }
}
