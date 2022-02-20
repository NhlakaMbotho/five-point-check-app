import 'package:driving_school_app/models/response.dart';

class User implements ResponseModel {
  int userId;
  String username;
  String identity;
  String dateOfBirth;
  String firstName;
  String lastName;
  String email;
  String phoneNo;
  String role;
  String token;

  User.fromJson(data) {
    userId = data['userId'];
    username = data['username'];
    identity = data['identity'];
    dateOfBirth = data['dateOfBirth'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'];
    phoneNo = data['phoneNo'];
    role = data['role'];
    token = data['token'];
  }
}
