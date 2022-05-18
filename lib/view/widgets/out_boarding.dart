import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';

class OutBoarding extends StatefulWidget {
  OutBoarding({
    Key? key,
    required this.title,
    required this.image,
    required this.subTitle,
  }) : super(key: key);

  String title;
  String subTitle;
  String image;

  @override
  State<OutBoarding> createState() => _OutBoardingState();
}

class _OutBoardingState extends State<OutBoarding> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: SvgPicture.asset(widget.image,height: 120.h,),
        ),
        Column(
          children: [
            Text(
              widget.title,
              style:  TextStyle(
                  color: ColorManger.lColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.subTitle,
                style: const TextStyle(
                  color: Color(0xffa1a1a1),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
