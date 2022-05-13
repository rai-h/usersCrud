import 'package:flutter/material.dart';
import 'package:users/constants/constants.dart';
import 'package:users/models/user.model.dart';
import 'package:users/services/user.services.dart';
import 'package:users/ui/dialogs/custom_dialog.dart';
import 'package:users/ui/helping_widget/rounded_button.dart';
import 'package:users/ui/screen/edit_user_screen/edit_user_screen.dart';

class UserCard extends StatelessWidget {
  final UserModel userModel;
  const UserCard({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                userModel.name ?? '',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${Constants.EMAIL} : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey.shade800),
                  ),
                  SizedBox(
                    width: size.width * 0.65,
                    child: Text(
                      userModel.email ?? "",
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey.shade500),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    '${Constants.GENDER} : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey.shade800),
                  ),
                  Text(
                    userModel.gender! == 'male'
                        ? Constants.MALE
                        : Constants.FEMALE,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey.shade500),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundButton(
                      onPress: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditUserScreen(
                            userModel: userModel,
                          ),
                        ));
                      },
                      color: Colors.green,
                      text: Constants.EDIT),
                  RoundButton(
                      onPress: () async {
                        await showCutomDialog(context, userModel.id!);
                      },
                      color: Colors.red,
                      text: Constants.DELETE),
                ],
              )
            ],
          ),
        ));
  }
}
