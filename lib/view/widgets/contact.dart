import 'package:flutter/material.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';

class Contact extends StatelessWidget {
   Contact({
    Key? key,
     required this.text,
     required this.iconData,
  }) : super(key: key);

  String text;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData,size: 32,color: ColorManger.defaultColor,),
        Text(text,style: TextStyle(color: ColorManger.liColor),),
      ],
    );
  }
}
