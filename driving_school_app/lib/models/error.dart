import 'dart:convert';

import 'dart:io';

class ServiceError {
  String code;
  String name;
  String message;
  String statusCode;
  ServiceError(String body) {
    dynamic _body = jsonDecode(body);
    this.code = _body["code"];
    this.name = _body["name"];
    this.message = _body["message"];
    this.statusCode = _body["statusCode"];
  }
}
