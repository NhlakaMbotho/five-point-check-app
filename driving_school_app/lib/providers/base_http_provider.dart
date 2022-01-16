import 'dart:io';

import 'package:driving_school_app/utilities/config_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaseHttpProvider {
  final String _root = getConfigValue(["http", "root"]);

  @protected
  Future post<Response>(url, body) {
    return http.post('$_root/$url', body: body);
  }

  @protected
  Future get<Response>(url, body) {
    return http.post('$_root/$url', body: body);
  }
}
