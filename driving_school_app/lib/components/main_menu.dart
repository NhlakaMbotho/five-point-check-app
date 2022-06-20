import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/routes/router.gr.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/app-nav.dart';
import 'nav_item.dart';

class NavHighlighter extends StatelessWidget {
  bool show = false;
  NavHighlighter(this.show);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 10,
      decoration: BoxDecoration(
        color: show ? AppColors.Primary : Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          bottomLeft: Radius.circular(6),
        ),
      ),
    );
  }
}

class LeftMenu extends StatelessWidget {
  final List<AppNav> navOptions;

  LeftMenu(this.navOptions);

  void navHandler(BuildContext ctx, TabsRouter tabsRouter, int index) {
    if (navOptions[index].pageRoute.routeName == 'LoginRoute') {
      AutoRouter.of(ctx).replaceAll([LoginRoute()]);
    } else {
      tabsRouter.setActiveIndex(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return Container(
        height: double.infinity,
        width: 160,
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.only(top: 100),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 40,
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavItem(
                    navOptions[index].iconData,
                    navOptions[index].label,
                    () => navHandler(context, tabsRouter, index),
                  ),
                  NavHighlighter(tabsRouter.activeIndex == index)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) =>
              SizedBox(height: 6, width: double.infinity),
          itemCount: navOptions.length,
        ));
  }
}
