import './response.dart';
import './role.dart';

class User implements ResponseModel {
  late int userId;
  late String username;
  late String identity;
  late String dateOfBirth;
  late String firstName;
  late String lastName;
  late String email;
  late String phoneNo;
  late Role role;
  late String token;

  User.fromJson(data) {
    userId = data['id'];
    username = data['username'];
    identity = data['identity'];
    dateOfBirth = data['dateOfBirth'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'] ?? '';
    phoneNo = data['phoneNo'] ?? '';
    role = Role(data['role']);
    token = data['token'];
  }
}
