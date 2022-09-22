import 'package:auto_route/auto_route.dart';
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
  Map<String, bool> steps = {
    'Sign Up': true,
    'Verification': false,
    'Avatar': false,
    'Complete': false
  };

  @override
  Widget build(BuildContext context) {
    var router = AutoTabsRouter.of(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Card(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(children: [
                        Expanded(
                            child: GestureDetector(
                              onTap: () => router.setActiveIndex(0),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: AppColors.PrimaryLight,
                                size: 40.0,
                              ),
                            ),
                            flex: 1),
                        Expanded(child: SequenceTrack(steps), flex: 3),
                        Expanded(child: SizedBox(), flex: 1),
                      ]),
                    ),
                    Expanded(
                      flex: 3,
                      child: Placeholder(color: Colors.blue),
                    ),
                    Expanded(
                      flex: 1,
                      child: Placeholder(color: Colors.orange),
                    )
                  ],
                ),
                width: constraints.maxWidth * .7,
                height: constraints.maxHeight * .8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              elevation: 70,
              shadowColor: Colors.grey.withOpacity(.1),
            ),
          );
        },
      ),
    );
  }

  saveChanges(UserCreateModel user) {
    print('user to be saved $user');
  }
}

class SequenceTrack extends StatelessWidget {
  final Map<String, bool> steps;
  SequenceTrack(Map<String, bool> steps) : steps = steps;

  @override
  Widget build(BuildContext context) {
    double radius = 60;
    return Row(
        children: steps.keys.map(((key) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: radius,
                width: radius,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.Primary,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: Center(child: Text('1')),
              ),
              Text(key),
            ],
          );
        })).toList(),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly);
  }
}
