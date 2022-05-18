import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/core/viewmodel/home_view_model.dart';
import 'package:rent_your_car/models/offer_model.dart';
import 'package:rent_your_car/models/payment.dart';
import 'package:rent_your_car/view/screens/user/user_screen.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';

import '../../../widgets/app_text_field.dart';

class PayMenScreen extends StatefulWidget {
   PayMenScreen({Key? key, required this.offer}) : super(key: key);
  late OfferModel offer;

  @override
  _PayMenScreenState createState() => _PayMenScreenState();
}

class _PayMenScreenState extends State<PayMenScreen> with Helpers {
  late TextEditingController _nameEditingController;
  late TextEditingController _nameCarEditingController;
  late TextEditingController _priceEditingController;
  late TextEditingController _cvvEditingController;
  late TextEditingController _numberEditingController;
  late TextEditingController _dateEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameEditingController = TextEditingController();
    _nameCarEditingController = TextEditingController(text: widget.offer.name);
    _priceEditingController = TextEditingController(text: widget.offer.price);
    _cvvEditingController = TextEditingController();
    _numberEditingController = TextEditingController();
    _dateEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameEditingController.dispose();
    _nameCarEditingController.dispose();
    _priceEditingController.dispose();
    _cvvEditingController.dispose();
    _numberEditingController.dispose();
    _dateEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تأكيد الدفع'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                'assets/images/online-payment.png',
                fit: BoxFit.cover,
                width: 150.w,
                height: 150.h,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              'الاسم على البطاقة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AppTextField(
              controller: _nameEditingController,
              hintText: 'الاسم على البطاقة',
              textInputType: TextInputType.text,
              radius: 12,
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              'رقم البطاقة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextField(
              controller: _numberEditingController,
              hintText: 'رقم البطاقة',
              textInputType: TextInputType.text,
              radius: 12,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'CVV',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            AppTextField(
              controller: _cvvEditingController,
              hintText: 'CVV',
              textInputType: TextInputType.text,
              radius: 12,
            ),
             SizedBox(
              height: 60.h,
            ),
            AppButton(
              text: 'تأكيد الدفع',
              onPressed: () async =>
                  await add(),
              color: ColorManger.defaultColor,
            ),
          ],
        ),
      ),
    );
  }
  Future<void> add() async {
    bool created = await HomeViewModel().payment(paymentModel: pay,);
    String message = created ? 'تم الدفع بنجاح' : ' فشل الدفع';
    if(created){
      showConfirmation(context, onPressed: () {
        Get.to(UserScreen());
      },
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Icon(
                created ? Icons.check_circle_outline_outlined : Icons.close,
                color: created ? Colors.green : Colors.red,
                size: 82,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 200.w,
                child: Text(
                  message,
                  style: TextStyle(
                      fontSize: 14, color: ColorManger.lColor),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
          textA: 'الرئيسية');
    }
  }

  PaymentModel get pay {
    PaymentModel pay = PaymentModel(
      price: _priceEditingController.text,
      nameCar: _nameCarEditingController.text,
      name: _nameEditingController.text,
      cvv: _cvvEditingController.text,
      date: DateTime.now(),
      number: _numberEditingController.text,
    );
    return pay;
  }
}
