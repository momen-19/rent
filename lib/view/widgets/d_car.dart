import 'package:flutter/material.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';

class Dcar extends StatelessWidget {
   Dcar({
    Key? key,
     required this.iconData,
     required this.text,
  }) : super(key: key);

  String text;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: ColorManger.blueBold,
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(
          color: ColorManger.liColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData,color: ColorManger.liColor,size: 32,),
          Text(text,style: TextStyle(color: ColorManger.liColor,fontSize: 12),)
        ],
      ),
    );
  }
}
