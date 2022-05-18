import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHeader extends StatelessWidget {
  AppHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
