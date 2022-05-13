import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:users/constants/api_urls.dart';
import 'package:users/controllers/home.controller.dart';
import 'package:users/models/user.model.dart';
import 'package:users/ui/dialogs/info_toast.dart';
import 'package:users/utils/api_calls.dart';
import 'package:users/utils/api_response.dart';

class UserService {
  static Future<List<UserModel>> getUsersList(BuildContext context) async {
    List<UserModel> userList = [];
    try {
      ApiResponse apiResponse =
          await ApiCalls.getCall(ApiUrls.BASE_URL + ApiUrls.GET_USERS);
      if (apiResponse.data != null) {
        apiResponse.data.forEach((element) {
          userList.add(UserModel.fromJson(element));
          Provider.of<HomeController>(context, listen: false)
              .changeUserList(userList);
        });
      }
    } catch (e) {
      return userList;
    }
    return userList;
  }

  static Future<void> deleteUser(int id, BuildContext context) async {
    try {
      ApiResponse apiResponse = await ApiCalls.deleteCall(
          ApiUrls.BASE_URL + ApiUrls.GET_USERS + '/$id');
      if (apiResponse.success) {
        InfoToast.showToast('User Deleted');
      }
    } catch (e) {
      InfoToast.showToast('Something Went Wrong');
    }
  }

  static Future<bool> updateUser(
      BuildContext context, UserModel userModel) async {
    try {
      ApiResponse apiResponse = await ApiCalls.patchCall(
          ApiUrls.BASE_URL + ApiUrls.GET_USERS + '/${userModel.id}',
          userModel.toJson());
      if (apiResponse.success) {
        InfoToast.showToast('User Updated');
      } else {
        InfoToast.showToast(apiResponse.error ?? "");
      }
      return apiResponse.success;
    } catch (e) {
      print(e);
      InfoToast.showToast('Something Went Wrong');
      return false;
    }
  }

  static Future<bool> addUser(BuildContext context, UserModel userModel) async {
    try {
      ApiResponse apiResponse = await ApiCalls.postCall(
          ApiUrls.BASE_URL + ApiUrls.GET_USERS, userModel.toJson());
      if (apiResponse.success) {
        InfoToast.showToast('User Added');
      } else {
        InfoToast.showToast(apiResponse.error ?? "");
      }
      return apiResponse.success;
    } catch (e) {
      print(e);
      InfoToast.showToast('Something Went Wrong');
      return false;
    }
  }
}
