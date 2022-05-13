import 'dart:convert';

import 'package:http/http.dart';

class ApiResponse {
  final String? error;
  final dynamic data;
  final bool success;
  ApiResponse({this.error, this.data, required this.success});
}

class ApiError {
  final String? field;
  final String? message;
  ApiError({this.field, this.message});
  ApiError.fromJson(Map<String, dynamic> json)
      : field = json['field'],
        message = json['message'];
}
