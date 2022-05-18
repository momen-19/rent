import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/core/viewmodel/home_view_model.dart';
import 'package:rent_your_car/models/category_model.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';
import 'package:rent_your_car/view/widgets/app_text_field.dart';

class UpdateCatScreen extends StatefulWidget {
  UpdateCatScreen({Key? key, this.category}) : super(key: key);

  CategoryModel? category;

  @override
  State<UpdateCatScreen> createState() => _UpdateCatScreenState();
}

class _UpdateCatScreenState extends State<UpdateCatScreen> with Helpers{
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(text: widget.category?.name ?? '');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الفئة'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تعديل فئة جديدة',
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
              controller: _controller,
              hintText: 'اسم الفئة',
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'صورة الفئة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AppButton(text: 'تعديل', onPressed: () async => await update(), color: ColorManger.defaultColor)
          ],
        ),
      ),
    );
  }

  Future<void> update() async {
    bool updated = widget.category == null
        ? await HomeViewModel().updateCategory(category: category)
        : await HomeViewModel().updateCategory(category: category);
    if(updated) clear();
    String message = updated ? 'تم التعديل بنجاح' : 'هناك خطا ما ';
    showSnackBar(context, message: message,error: !updated);
  }

  CategoryModel get category{
    CategoryModel category  = CategoryModel(name: _controller.text, image: 'https://firebasestorage.googleapis.com/v0/b/rent-car-4d540.appspot.com/o/test.png?alt=media&token=8b78ebd0-08b2-4883-852e-6dae51b5f465');
    if(widget.category != null){
      category.id = widget.category!.id;
    }
    return category;
  }

  void clear(){
    _controller.text = '';
  }
}
