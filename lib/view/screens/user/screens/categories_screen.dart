import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/core/viewmodel/home_view_model.dart';
import 'package:rent_your_car/models/category_model.dart';
import 'package:rent_your_car/view/screens/app/categories/add_category.dart';
import 'package:rent_your_car/view/screens/app/categories/update_cat_screen.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key}) : super(key: key);


  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with Helpers{
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفئات'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: HomeViewModel().getCategory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w,vertical: 20.h),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 15.h),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                              tileColor: ColorManger.blueBold,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              leading: Image.network(
                                  snapshot.data!.docs[index].get('image')),
                              title: Text(
                                snapshot.data!.docs[index].get('name'),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManger.lColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  'لا توجد فئات حاليا',
                  style: TextStyle(fontSize: 20, color: ColorManger.lColor),
                ),
              );
            }
          }),
    );
  }
  Future<void> deleteCat({required String path})async{
    bool deleted =  await HomeViewModel().deleteCategory(path);

    String message = deleted ? 'تم الحذف بنجاح' : ' فشل الحذف';
    if(deleted){
      showSnackBar(context, message: message, error: !deleted);
    }
  }

  CategoryModel getCategory(QueryDocumentSnapshot documentSnapshot){
    CategoryModel categoryModel = CategoryModel(name: documentSnapshot.get('name'),image: documentSnapshot.get('image'),);
    categoryModel.id = documentSnapshot.id;
    return categoryModel;
  }
}
