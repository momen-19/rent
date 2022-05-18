import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/viewmodel/auth_view_model.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';
import 'package:rent_your_car/view/widgets/app_text_field.dart';


class LoginScreen extends GetWidget<AuthViewModel>{
   const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.scaColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Center(
          child: ListView(
            padding: EdgeInsets.only(top: 170.h),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/car-rent.png',
                        height: 50.h,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: ColorManger.lColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'البريد الالكتروني',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextField(
                    controller: controller.emailLoginEditingController,
                    hintText: 'البريد الالكتروني',
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Text(
                    'كلمة المرور',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.passwordLoginEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: controller.obText,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        controller.oText();
                      },icon: Icon(Icons.remove_red_eye_outlined,color: ColorManger.liColor,)),
                      contentPadding: const EdgeInsets.only(right: 10),
                      hintText: 'كلمة المرور',
                      hintStyle: TextStyle(
                        color: ColorManger.liColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: ColorManger.liColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          15.sp,
                        ),
                      ),
                      constraints: const BoxConstraints(
                        minHeight: 50,
                        maxHeight: 60,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: ColorManger.lColor,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  AppButton(
                    text: 'تسجيل الدخول',
                    onPressed: (){
                      controller.checkDataLogin(context);
                      controller.signInWithEmailAndPassword(context);
                      controller.clear();
                    },
                    color: ColorManger.defaultColor,
                  ),
                ],
              ),
              SizedBox(height: 30.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'اذا كنت لا تمتلك حساب؟',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          recognizer: controller.tapGestureRecognizer..onTap = controller.navigateToRegister,
                          text: 'سجل الان',
                          style: TextStyle(
                            color: ColorManger.defaultColor,
                            fontFamily: 'Cairo',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
