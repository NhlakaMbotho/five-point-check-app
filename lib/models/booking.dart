import 'package:flutter/material.dart';

import '../constants/booking-status.dart';

class Booking {
  final int id;
  final int hours;
  final DateTime startAt;
  final BookingStatus status;

  Booking(dynamic value)
      : id = value['id'] as int,
        hours = value['hours'] as int,
        status = value['status'] as BookingStatus,
        startAt = value['startAt'] as DateTime {}
}
