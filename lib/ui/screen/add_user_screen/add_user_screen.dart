import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:users/constants/app_colors.dart';
import 'package:users/constants/constants.dart';
import 'package:users/models/user.model.dart';
import 'package:users/services/user.services.dart';
import 'package:users/ui/helping_widget/custom_textfield.dart';
import 'package:users/ui/helping_widget/rounded_button.dart';
import 'package:users/utils/validator.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String? _gender;
  String? _activeStatus;

  String genderError = '';
  String emailError = '';
  String nameError = '';

  @override
  void initState() {
    _activeStatus = 'active';
    // TODO: implement initState
    super.initState();
  }

  validateInput() {
    emailError = Validator.validateEmail(_emailController.text.trim());
    nameError = Validator.validateName(_nameController.text.trim());
    if (_gender == null) {
      genderError = 'Please Select a gender';
    } else {
      genderError = '';
    }

    setState(() {});
    if (emailError.isEmpty && nameError.isEmpty && genderError.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          Constants.EDIT_USER,
          style: TextStyle(
              color: AppColors.BLUE, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomTextField(
              prefixIcon: const Icon(Icons.person),
              text: Constants.NAME,
              controller: _nameController,
              errorText: nameError,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              prefixIcon: const Icon(Icons.email_rounded),
              text: Constants.EMAIL,
              controller: _emailController,
              errorText: emailError,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        Constants.GENDER,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.grey.shade400),
                      ),
                      items: [Constants.MALE, Constants.FEMALE]
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: Colors.grey.shade500),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                      buttonPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade50),
                      buttonElevation: 4,
                      itemHeight: 35,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownPadding: null,
                      dropdownFullScreen: true,
                      selectedItemHighlightColor: Colors.blue.shade100,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.grey.shade100,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(0, 0),
                    ),
                  ),
                  _gender == null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                genderError,
                                style: TextStyle(color: Colors.red),
                              )),
                        )
                      : Container(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Constants.ACTIVE_STATUS,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey.shade800),
                ),
                Switch(
                  onChanged: (value) {
                    if (value) {
                      _activeStatus = 'active';
                    } else {
                      _activeStatus = 'inactive';
                    }
                    setState(() {});
                  },
                  value: _activeStatus == 'active' ? true : false,
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.green,
                  inactiveThumbColor: Colors.grey.shade900,
                  inactiveTrackColor: Colors.grey,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            RoundButton(
              onPress: () async {
                if (validateInput()) {
                  if (await UserService.addUser(
                      context,
                      UserModel.fromJson({
                        'name': _nameController.text.trim(),
                        'email': _emailController.text.trim(),
                        'gender': _gender,
                        'status': _activeStatus,
                        'id': 0
                      }))) {
                    Navigator.of(context).pop();
                    await UserService.getUsersList(context);
                  }
                }
              },
              color: Colors.blue,
              text: Constants.SAVE_CHANGES,
            ),
          ],
        ),
      ),
    );
  }
}
