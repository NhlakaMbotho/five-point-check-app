import 'dart:convert';
import 'package:driving_school_app/models/error.dart';
import 'package:driving_school_app/models/response.dart';
import 'package:driving_school_app/utilities/config_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceResponse<T extends ResponseModel> extends http.Response {
  ServiceResponse(String body, int statusCode) : super(body, statusCode) {}

  ServiceResponse.fromResponse(http.Response response)
      : super(response.body, response.statusCode) {
    if (statusCode != 200) {
      throw new ServiceError(body);
    }
  }

  dynamic getBody() {
    return jsonDecode(body);
  }
}

class BaseHttpProvider {
  String _root = getConfigValue(["http", "root"]);

  @protected
  Future<ServiceResponse> post<T>(url, body) async {
    var response = await http.post('$_root$url',
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });
    return ServiceResponse.fromResponse(response);
  }

  @protected
  Future get<Response>(url, body) {
    return http.post('$_root/$url', body: body);
  }
}
