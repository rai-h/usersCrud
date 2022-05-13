import 'package:flutter/cupertino.dart';
import 'package:users/constants/constants.dart';

class Validator {
  static String validateEmail(String email) {
    if (email.isEmpty) {
      return Constants.PLEASE_PROVIDE_EMAIL;
    }
    if (!isEmail(email)) {
      return Constants.INVALID_EMAIL;
    }
    return '';
  }

  static bool isEmail(String email) {
    RegExp regExp = RegExp(Constants.EMAIL_REGEXP);

    return regExp.hasMatch(email);
  }

  static String validateName(String value) {
    final RegExp nameRegExp = RegExp(Constants.NAME_REGEXP);
    if (value.length == 0) {
      return Constants.PLEASE_ENTER_NAME;
    } else if (!nameRegExp.hasMatch(value)) {
      return Constants.PLEASE_ENTER_VALID_NAME;
    }
    return '';
  }
}
