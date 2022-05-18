import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/core/viewmodel/auth_view_model.dart';
import 'package:rent_your_car/view/screens/auth/login_screen.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';
import 'package:rent_your_car/view/widgets/app_text_field.dart';


class RegisterScreen extends GetWidget<AuthViewModel> with Helpers {
  RegisterScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.scaColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/car-rent.png',
                          height: 60.h,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'تسجيل الحساب',
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
                SizedBox(
                  height: 40.h,
                ),
                const Text(
                  'الاسم كاملا',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                  controller: controller.nameRegisterEditingController,
                  hintText: 'الاسم كاملا',
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: 15.h,
                ),
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
                  controller: controller.emailRegisterEditingController,
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
                  controller: controller.passwordRegisterEditingController,
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
                  height: 15.h,
                ),
                const Text(
                  'رقم الجوال',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                  controller: controller.phoneRegisterEditingController,
                  hintText: 'رقم الجوال',
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: 60.h,
                ),
                AppButton(
                  text: 'تسجيل',
                  onPressed: (){
                    controller.createAccountWithEmailAndPassword(context);
                    controller.clear();
                  },
                  color: ColorManger.defaultColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

