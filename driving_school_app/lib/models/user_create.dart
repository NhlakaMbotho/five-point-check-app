import 'package:driving_school_app/models/user.dart';

class UserCreateModel {
  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNo = '';
  String addressLine1 = '';
  String addressLine2 = '';
  String addressLine3 = '';
  String addressLine4 = '';
  String addressLine5 = '';

  UserCreateModel() {}

  UserCreateModel.fromExistingUser(User user) {
    firstName = user.firstName;
    lastName = user.lastName;
    email = user.email;
    phoneNo = user.phoneNo;
    // addressLine1 = user.firstName;
    // addressLine2 = user.firstName;
    // addressLine3 = user.firstName;
    // addressLine4 = user.firstName;
    // addressLine5 = user.firstName;
  }
}
