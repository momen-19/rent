import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatefulWidget {
  AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.colorText = Colors.white,
    this.width = double.infinity,
    this.hig = 45,
    this.radius = 15,
  }) : super(key: key);

  String text;
  void Function() onPressed;
  double width;
  double hig;
  double radius;
  Color color;
  Color colorText;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style:  TextStyle(
            color:widget.colorText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
      style: ElevatedButton.styleFrom(
          primary: widget.color,
          minimumSize: Size(widget.width, widget.hig),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        )
      ),
    );
  }
}
