import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';

mixin Helpers {
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        duration: const Duration(seconds: 3),
        content: Text(message,style: TextStyle(fontFamily: 'Cairo',fontSize: 16)),
        backgroundColor: error ? Colors.red.shade700 : Colors.green,
      ),
    );
  }

  Future<String> pickDate(BuildContext context) async {
    DateTime? pickDate = await showDatePicker(
      helpText: 'اختر تاريخ الحجز المناسب لك',
      confirmText: 'تأكيد',
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        2022,
        4,
        1,
      ),
      lastDate: DateTime(
        2030,
        4,
        1,
      ),
    );
    return pickDate.toString();
  }

  Future<void> showConfirmation(BuildContext context,
      {required Widget content,
      required String textA,
      required void Function() onPressed}) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: ColorManger.scaColor,
          content: content,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    flex: 3,
                    child: AppButton(
                      onPressed: onPressed,
                      text: textA,
                      width: 140.w,
                      color: ColorManger.defaultColor,
                      hig: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    flex: 1,
                    child: AppButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      text: 'الغاء',
                      width: 70.w,
                      color: ColorManger.defaultColor,
                      hig: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
