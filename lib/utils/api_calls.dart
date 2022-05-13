import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:users/constants/api_urls.dart';
import 'package:users/ui/dialogs/info_toast.dart';

import 'package:users/utils/api_response.dart';

class ApiCalls {
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eb5d81d7ca4a67866e7e06ed10134d34992927e19bdabeac9ba6da289783410c',
    'Content-Type': 'application/json'
  };

  static Future<ApiResponse> getCall(String url) async {
    try {
      InfoToast.showLoading();
      Response response = await http.get(Uri.parse(url), headers: headers);
      InfoToast.dismissLoading();
      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: jsonDecode(response.body));
      } else {
        return ApiResponse(success: false, error: 'Something Went Wrong');
      }
    } catch (e) {
      return ApiResponse(success: false, error: 'Something Went Wrong');
    }
  }

  static Future<ApiResponse> deleteCall(String url) async {
    try {
      InfoToast.showLoading();
      Response response = await http.delete(Uri.parse(url), headers: headers);
      InfoToast.dismissLoading();

      if (response.statusCode == 204) {
        return ApiResponse(success: true, data: jsonDecode(response.body));
      } else {
        return ApiResponse(success: false, error: 'Something Went Wrong');
      }
    } catch (e) {
      return ApiResponse(success: false, error: 'Something Went Wrong');
    }
  }

  static Future<ApiResponse> patchCall(
      String url, Map<String, dynamic> body) async {
    try {
      InfoToast.showLoading();
      Response response = await http.patch(Uri.parse(url),
          body: jsonEncode(body), headers: headers);

      InfoToast.dismissLoading();

      if (response.statusCode == 200) {
        return ApiResponse(success: true, data: jsonDecode(response.body));
      } else if (response.statusCode == 422) {
        return ApiResponse(
            success: false,
            error:
                '${jsonDecode(response.body)[0]['field']} ${jsonDecode(response.body)[0]['message']}');
      } else {
        return ApiResponse(success: false, error: 'Something Went Wrong');
      }
    } catch (e) {
      print(e);
      return ApiResponse(success: false, error: 'Something Went Wrong');
    }
  }

  static Future<ApiResponse> postCall(
      String url, Map<String, dynamic> body) async {
    try {
      InfoToast.showLoading();
      Response response = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: headers);

      InfoToast.dismissLoading();
      print(response.statusCode);
      print(url);
      if (response.statusCode == 201) {
        return ApiResponse(success: true, data: jsonDecode(response.body));
      } else if (response.statusCode == 422) {
        return ApiResponse(
            success: false,
            error:
                '${jsonDecode(response.body)[0]['field']} ${jsonDecode(response.body)[0]['message']}');
      } else {
        return ApiResponse(success: false, error: 'Something Went Wrong');
      }
    } catch (e) {
      print(e);
      return ApiResponse(success: false, error: 'Something Went Wrong');
    }
  }
}
