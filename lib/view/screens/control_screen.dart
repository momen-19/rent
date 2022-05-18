import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/viewmodel/auth_view_model.dart';
import 'package:rent_your_car/view/screens/app/main_screen.dart';
import 'package:rent_your_car/view/screens/user/user_screen.dart';

class ControlScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user == 'admin@gmail.com'
          ? MainScreen()
          : UserScreen();
    });
  }
}
