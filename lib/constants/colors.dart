import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // static const Color Primary = Color(0xFF0099B4);
  static const Color Primary = const Color(0xFF00B7CF);
  static const Color GreyLight = const Color(0xFFf5f5f5);
  static const Color GreyDark = const Color(0xFFe6e6e6);
  static const Color PrimaryLight = const Color(0xFF00B7CF);
  static const Color Dark = const Color(0xFF455A64);
  static const Color Success = Colors.green;
}

enum AppStyleTypes { PRIMARY, SECONDARY, TERTIARY }

enum LessonStatus {
  PLANNED,
  MISSED,
  COMPLETED,
}

enum AvailabilityStatus { AVAILABLE, OFFLINE, BUSY }

enum UserType { CLIENT, INSTRUCTOR, ADMIN }
