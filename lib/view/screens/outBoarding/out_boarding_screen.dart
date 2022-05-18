import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/view/screens/auth/login_screen.dart';
import 'package:rent_your_car/view/screens/auth/register_screen.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';
import 'package:rent_your_car/view/widgets/out_boarding.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.scaColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 13,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int value) {
                  setState(() {
                    _index = value;
                  });
                },
                children: [
                  OutBoarding(
                    image: 'assets/icons/logo.svg',
                    title: 'معلومات عن التطبيق 1',
                    subTitle:
                        'لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة والتنضيد. كان Lorem Ipsum هو النص الوهمي القياسي في الصناعة منذ القرن الخامس عشر الميلادي ، عندما أخذت طابعة ',
                  ),
                  OutBoarding(
                    image: 'assets/icons/logo.svg',
                    title: 'معلومات عن التطبيق 2',
                    subTitle:
                        'لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة والتنضيد. كان Lorem Ipsum هو النص الوهمي القياسي في الصناعة منذ القرن الخامس عشر الميلادي ، عندما أخذت طابعة ',
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _index == 0,
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorManger.defaultColor,
                ),
                child: IconButton(
                  padding: EdgeInsets.only(right: 6.w),
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorManger.lColor,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _index == 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    text: 'تسجيل الدخول',
                    width: 160.w,
                    color: const Color(0xff181a26),
                  ),
                  AppButton(
                    onPressed: () {
                      Get.to(RegisterScreen());
                    },
                    text: 'حساب جديد',
                    width: 160.w,
                    color: const Color(0xff82000f),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
