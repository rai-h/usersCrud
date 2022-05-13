import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users/constants/app_colors.dart';
import 'package:users/constants/constants.dart';
import 'package:users/services/user.services.dart';
import 'package:users/ui/dialogs/info_toast.dart';
import 'package:users/ui/helping_widget/rounded_button.dart';

showCutomDialog(BuildContext context, int id) {
  Size size = MediaQuery.of(context).size;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              Constants.ALERT,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.DARKGREY),
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.warning,
              color: AppColors.RED,
            ),
          ]),
          content: Text(
            Constants.DELETE_QUESTION,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.GREY),
          ),
          actions: [
            RoundButton(
                onPress: () async {
                  Navigator.of(context).pop();
                },
                color: AppColors.BLUE,
                text: Constants.CANCEL),
            RoundButton(
                onPress: () async {
                  await UserService.deleteUser(id, context);
                  await UserService.getUsersList(context);
                  InfoToast.showToast('User Deleted');
                  Navigator.pop(context);
                },
                color: AppColors.RED,
                text: Constants.DELETE),
          ],
        );
      });
}
