import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/core/viewmodel/home_view_model.dart';
import 'package:rent_your_car/models/category_model.dart';
import 'package:rent_your_car/models/offer_model.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';
import 'package:rent_your_car/view/widgets/app_text_field.dart';

class UpdateOfferScreen extends StatefulWidget {
  UpdateOfferScreen({Key? key, this.offer}) : super(key: key);

  OfferModel? offer;

  @override
  State<UpdateOfferScreen> createState() => _UpdateOfferScreenState();
}

class _UpdateOfferScreenState extends State<UpdateOfferScreen> with Helpers{

  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _desController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text: widget.offer?.name ?? '');
    _priceController = TextEditingController(text: widget.offer?.price ?? '');
    _desController = TextEditingController(text: widget.offer?.des ?? '');
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
        title: Text('تعديل العرض'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'تعديل العرض ',
                style: TextStyle(
                  color: ColorManger.defaultColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: ColorManger.lColor,
                height: 50,
              ),
              const Text(
                'اسم الفئة',
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
                hintText: 'اسم الفئة',
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
              AppButton(text: 'تعديل', onPressed: () async => await update(), color: ColorManger.defaultColor)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> update() async {
    bool updated = widget.offer == null
        ? await HomeViewModel().updateOffer(offer: offer)
        : await HomeViewModel().updateOffer(offer: offer);
    if(updated) clear();
    String message = updated ? 'تم التعديل بنجاح' : 'هناك خطا ما ';
    showSnackBar(context, message: message,error: !updated);
  }

  OfferModel get offer{
    OfferModel offer  = OfferModel(rating: 0,name: _nameController.text,des: _desController.text,price: _priceController.text, image: 'https://firebasestorage.googleapis.com/v0/b/rent-car-4d540.appspot.com/o/test.png?alt=media&token=8b78ebd0-08b2-4883-852e-6dae51b5f465');
    if(widget.offer != null){
      offer.id = widget.offer!.id;
    }
    return offer;
  }

  void clear(){
    _nameController.text = '';
    _desController.text = '';
    _priceController.text = '';
  }
}
