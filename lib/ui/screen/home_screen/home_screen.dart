import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users/constants/app_colors.dart';
import 'package:users/constants/constants.dart';
import 'package:users/controllers/home.controller.dart';
import 'package:users/models/user.model.dart';
import 'package:users/services/user.services.dart';
import 'package:users/ui/screen/add_user_screen/add_user_screen.dart';
import 'package:users/ui/screen/home_screen/widget.dart';
import 'package:users/utils/api_calls.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<UserModel> userList = [];

  @override
  void initState() {
    UserService.getUsersList(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.BLUE,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddUserScreen(),
              ));
            },
            child: const Icon(Icons.person_add)),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            Constants.USER_DATA,
            style: TextStyle(
                color: AppColors.BLUE,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SizedBox(
          height: size.height * 0.9,
          child: Consumer<HomeController>(builder: (context, notifier, _) {
            return ListView.builder(
              itemCount: notifier.getUserList.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: UserCard(
                      userModel: notifier.getUserList[index],
                    ));
              },
            );
          }),
        ));
  }
}
