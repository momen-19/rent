import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_your_car/view/screens/control_screen.dart';
import 'package:rent_your_car/view/screens/outBoarding/out_boarding_screen.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';

class LunchScreen extends StatelessWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: ColorManger.scaColor,
        splash: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(width: 15,),
            Text(
              'G O T O',
              style: TextStyle(
                color: ColorManger.defaultColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 20.w),
            Image.asset('assets/images/car-rent.png',height: 100.h),
          ],
        ),
        nextScreen: ControlScreen(),
        splashTransition: SplashTransition.scaleTransition,
        animationDuration: const Duration(seconds: 3),
      ),
    );
  }
}


