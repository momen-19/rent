import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/core/viewmodel/home_view_model.dart';
import 'package:rent_your_car/models/category_model.dart';
import 'package:rent_your_car/view/screens/app/categories/categories_screen.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';
import 'package:rent_your_car/view/widgets/app_text_field.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> with Helpers {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
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
        title: Text('أضافة فئة جديدة'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              AppButton(
                  text: 'أضافة',
                  onPressed: () async {
                    await add();
                  },
                  color: ColorManger.defaultColor)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> add() async {
    bool created =
        await HomeViewModel().createCategory(categoryModel: category);
    String message = created ? 'تم الاضافة بنجاح' : ' فشل الاضافة';
    if (created) {
      Get.to(CategoriesScreen());
      showSnackBar(context, message: message, error: !created);
    }
  }

  CategoryModel get category {
    CategoryModel category = CategoryModel(
        name: _controller.text,
        image:
            'https://firebasestorage.googleapis.com/v0/b/rent-car-4d540.appspot.com/o/test.png?alt=media&token=8b78ebd0-08b2-4883-852e-6dae51b5f465');
    return category;
  }
}
