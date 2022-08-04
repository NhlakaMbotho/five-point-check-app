import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/components/user_form.dart';
import 'package:flutter/material.dart';

import '../models/user_create.dart';

class UserCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var router = AutoTabsRouter.of(context);
    return Scaffold(
      // backgroundColor: AppColors.GreyLight,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              width: constraints.maxWidth / 1.6,
              padding: const EdgeInsets.all(40),
              child: Card(
                child: UserForm(
                  isEdit: false,
                  saveHandler: saveChanges,
                  backHandler: () =>
                      router.setActiveIndex(router.previousIndex ?? 0),
                ),
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

  saveChanges(UserCreateModel user) {
    print('user to be saved $user');
  }
}
