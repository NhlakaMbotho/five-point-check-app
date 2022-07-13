import 'package:driving_school_app/models/booking.dart';

import '../constants/booking-status.dart';
import './response.dart';
import './role.dart';

class User implements ResponseModel {
  int userId;
  String username;
  String identity;
  String dateOfBirth;
  String firstName;
  String lastName;
  String email;
  String phoneNo;
  List<Booking> instructorBookings = [];
  Role role;
  String? token;

  User.fromJson(data)
      : userId = data['id'],
        username = data['username'],
        identity = data['identity'],
        dateOfBirth = data['dateOfBirth'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'] ?? '',
        phoneNo = data['cellNo'] ?? '',
        role = Role(data['role']),
        token = data['token'] {
    if (data['instructorBookings'] != null) {
      instructorBookings = (data['instructorBookings'] as List<dynamic>)
          .map((_rawBooking) => Booking(_rawBooking))
          .toList();
    }
  }

  int get pendingLessonsCount {
    return this
        .instructorBookings
        .where((b) => b.status == BookingStatus.REQUESTED)
        .length;
  }

  int get totalHoursThisWeek {
    return this
        .instructorBookings
        .where((b) => _withinThisWeek(b.startAt))
        .length;
  }

  bool _withinThisWeek(DateTime date) {
    var d = DateTime.now();
    var weekDay = d.weekday;
    var firstDayOfWeek = d.subtract(Duration(days: weekDay));
    return date.isAfter(firstDayOfWeek);
  }
}
