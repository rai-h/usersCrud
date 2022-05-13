import 'package:flutter/cupertino.dart';
import 'package:users/models/user.model.dart';

class HomeController extends ChangeNotifier {
  List<UserModel> _userList = [];

  List<UserModel> get getUserList => _userList;

  changeUserList(List<UserModel> userList) {
    _userList = userList;
    notifyListeners();
  }
}
