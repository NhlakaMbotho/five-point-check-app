import 'package:flutter/material.dart';

import '../constants/colors.dart';

class StatusWidget extends StatelessWidget {
  final AvailabilityStatus status;
  StatusWidget(AvailabilityStatus status) : status = status;

  String get label {
    switch (status) {
      case AvailabilityStatus.AVAILABLE:
        return 'Available';
      case AvailabilityStatus.OFFLINE:
        return 'Offline';
      case AvailabilityStatus.BUSY:
        return 'Busy';
    }
  }

  Color get color {
    switch (status) {
      case AvailabilityStatus.AVAILABLE:
        return Colors.green;
      case AvailabilityStatus.OFFLINE:
        return Colors.red;
      case AvailabilityStatus.BUSY:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(label, style: TextStyle(color: color))),
      height: 30,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color),
      ),
    );
  }
}
