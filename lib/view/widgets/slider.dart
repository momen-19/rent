import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSlider extends StatelessWidget {
   AppSlider({
    Key? key,
     required this.title,
     required this.image,
  }) : super(key: key);
  String image;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.w,),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white,fontSize: 24.sp,fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Image.asset(image)),
          ),
        ],
      ),
    );
  }
}
