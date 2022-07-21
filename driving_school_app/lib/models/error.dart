import 'dart:convert';

import 'dart:io';

class ServiceError {
  late String code;
  late String name;
  late String message;
  late int statusCode;
  ServiceError(String body, int statusCode) {
    dynamic _body = jsonDecode(body);
    this.code = _body["code"];
    this.name = _body["name"];
    this.message = _body["message"];
    this.statusCode = statusCode;
  }
}
