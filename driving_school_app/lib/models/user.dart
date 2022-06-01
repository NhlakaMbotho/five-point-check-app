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
  Role role;
  String token;

  User.fromJson(data) {
    userId = data['Id'];
    username = data['username'];
    identity = data['identity'];
    dateOfBirth = data['dateOfBirth'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'];
    phoneNo = data['phoneNo'];
    role = Role(data['role']);
    token = data['token'];
  }
}
