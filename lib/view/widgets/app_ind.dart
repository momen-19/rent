import 'package:flutter/material.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';

class AppInd extends StatelessWidget {
  AppInd({
    Key? key,
    this.marginR = 0,
    required this.selected,
  }) : super(key: key);

  double marginR ;
  bool selected;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: selected ? 35 : 20,
      height: 2,
      margin: EdgeInsets.only(right: marginR),
      decoration: BoxDecoration(
        color: selected ?  ColorManger.defaultColor : ColorManger.liColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}