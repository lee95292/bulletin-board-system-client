import 'package:bulltin_board_system/controller/UserController.dart';
import 'package:bulltin_board_system/page/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    if (userController.isLoggin.value)
      return Container(
        child: Text("Hello, User!"),
      );
    else {
      Get.toNamed(Routes.Auth);
      return Text("Go to login");
    }
  }
}
