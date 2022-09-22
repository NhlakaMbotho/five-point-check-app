import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

typedef void clickHandler(TabsRouter router, int index);

class AppNav {
  final String label;
  final IconData iconData;
  final PageRouteInfo<void> pageRoute;
  AppNav(String label, IconData iconData, PageRouteInfo<void> pageRoute)
      : label = label,
        iconData = iconData,
        pageRoute = pageRoute {}
}
