import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../app_button.dart';

class CompleteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tabsRouter = AutoTabsRouter.of(context);
    var instructorName = "Micheal Ryan";
    return LayoutBuilder(builder: ((context, constraints) {
      print('heigh ${constraints.maxHeight}, ${constraints.maxHeight * 0.05}');
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: constraints.maxWidth * .5,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                padding: EdgeInsets.all(60),
                decoration: BoxDecoration(
                    color: AppColors.Success.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You\'ve successfully enrolled ',
                      style: TextStyle(
                        color: AppColors.Success,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${instructorName}',
                      style: TextStyle(
                        color: AppColors.Success,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' as an instructor! ',
                      style: TextStyle(
                        color: AppColors.Success,
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.check_circle_rounded, color: AppColors.Success),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: constraints.maxHeight * .15),
          SizedBox(
            width: constraints.maxWidth * .1,
            child: AppButton(
              child: Text('Okay'),
              type: AppStyleTypes.PRIMARY,
              elevation: MaterialStateProperty.all(0),
              onPressed: () => tabsRouter.setActiveIndex(0),
            ),
          ),
        ]),
      );
    }));
  }
}
