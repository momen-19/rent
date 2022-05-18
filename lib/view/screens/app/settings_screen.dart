import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/viewmodel/auth_view_model.dart';
import 'package:rent_your_car/view/screens/app/categories/categories_screen.dart';
import 'package:rent_your_car/view/screens/app/offers/offers.dart';
import 'package:rent_your_car/view/screens/outBoarding/out_boarding_screen.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';

class SettingsScreen extends GetWidget<AuthViewModel> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            ListTile(
              tileColor: ColorManger.blueBold,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onTap: (){
                Get.to(CategoriesScreen());
              },
              leading: Icon(Icons.category_outlined,color: ColorManger.lColor),
              title: Text('الفئات',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: ColorManger.lColor)),
            ),
            SizedBox(height: 15.h),
            ListTile(
              tileColor: ColorManger.blueBold,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onTap: (){
                Get.to(OffersScreen());
              },
              leading: Icon(Icons.local_offer_outlined,color: ColorManger.lColor),
              title: Text('عروض التأجير',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: ColorManger.lColor)),
            ),
            AppButton(text: 'text', onPressed: (){
              Get.offAll(OutBoardingScreen());
            }, color: Colors.amber)
          ],
        ),
      ),
    );
  }
}
