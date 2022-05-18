import 'package:flutter/material.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    required this.hintText,
    required this.textInputType,
    required this.controller,
    this.radius = 12,
  }) : super(key: key);
  String hintText;
  TextInputType textInputType;
  double radius;
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(right: 10),
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorManger.liColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ColorManger.liColor,
          ),
          borderRadius: BorderRadius.circular(
            radius,
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
    );
  }
}
