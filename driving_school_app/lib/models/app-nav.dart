import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppNav {
  final String label;
  final IconData iconData;
  final PageRouteInfo pageRoute;
  const AppNav(String label, IconData iconData, PageRouteInfo pageRoute)
      : label = label,
        iconData = iconData,
        pageRoute = pageRoute;
}
