import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/view/screens/outBoarding/out_boarding_screen.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppButton(text: 'text', onPressed: (){
          Get.to(const OutBoardingScreen());
        }, color: ColorManger.defaultColor),
      ),
    );
  }
}
