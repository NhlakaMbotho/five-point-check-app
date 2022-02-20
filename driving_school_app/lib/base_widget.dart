import 'package:flutter/cupertino.dart';

class AppDimensions {
  AppDimensions();

  cardWidth(BuildContext ctx) {
    return MediaQuery.of(ctx).size.width * 0.06;
  }
}
