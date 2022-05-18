import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/core/viewmodel/home_view_model.dart';
import 'package:rent_your_car/models/offer_model.dart';
import 'package:rent_your_car/view/screens/app/offers/offers.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';
import 'package:rent_your_car/view/widgets/app_text_field.dart';

class AddOfferScreen extends StatefulWidget {
  const AddOfferScreen({Key? key}) : super(key: key);

  @override
  State<AddOfferScreen> createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddOfferScreen> with Helpers {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _desController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _desController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _priceController.dispose();
    _desController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضافة عرض جديد'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'اسم السيارة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                controller: _nameController,
                hintText: 'اسم السيارة',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'وصف السيارة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                controller: _desController,
                hintText: 'وصف السيارة',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'صورة السيارة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.photo_outlined,
                              color: ColorManger.lColor,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'ارفق الصورة',
                              style: TextStyle(color: ColorManger.liColor),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'السعر',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 200,
                          child: AppTextField(
                            controller: _priceController,
                            hintText: 'السعر',
                            textInputType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              AppButton(
                text: 'أضافة',
                onPressed: () async {
                  await add();
                },
                color: ColorManger.defaultColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> add() async {
    bool created = await HomeViewModel().createOffer(offerModel: offer);
    String message = created ? 'تم الاضافة بنجاح' : ' فشل الاضافة';
    if (created) {
      Get.to(OffersScreen());
      showSnackBar(context, message: message, error: !created);
    }
  }

  OfferModel get offer {
    OfferModel offer = OfferModel(
      rating: 0,
        name: _nameController.text,
        price: _priceController.text,
        des: _desController.text,
        image:
            'https://firebasestorage.googleapis.com/v0/b/rent-car-4d540.appspot.com/o/test.png?alt=media&token=8b78ebd0-08b2-4883-852e-6dae51b5f465');
    return offer;
  }
}
