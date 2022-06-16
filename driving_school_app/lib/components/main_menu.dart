import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/app-nav.dart';

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

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);

    print('left menu rendered!!');
    return Container(
      height: double.infinity,
      width: 200,
      decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(top: 100),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final size = MediaQuery.of(context).size;
          return Container(
            height: 40,
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height,
                  width: 160,
                  child: TextButton(
                    onPressed: () => tabsRouter.setActiveIndex(index),
                    autofocus: index == 0,
                    child: Row(
                      children: [
                        Icon(
                          navOptions[index].iconData,
                          color: AppColors.Primary,
                        ),
                        SizedBox(width: 10),
                        Text(
                          navOptions[index].label,
                          style: TextStyle(
                            color: AppColors.Primary,
                            fontSize: 14,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                NavHighlighter(tabsRouter.activeIndex == index)
              ],
            ),
          );
        },
        separatorBuilder: (context, index) =>
            SizedBox(height: 6, width: double.infinity),
        itemCount: navOptions.length,
      ),
    );
  }
}
