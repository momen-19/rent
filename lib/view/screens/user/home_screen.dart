import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/viewmodel/home_view_model.dart';
import 'package:rent_your_car/models/category_model.dart';
import 'package:rent_your_car/models/offer_model.dart';
import 'package:rent_your_car/view/screens/user/details/details_screen.dart';
import 'package:rent_your_car/view/screens/user/screens/categories_screen.dart';
import 'package:rent_your_car/view/screens/user/screens/offers.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 200.0, autoPlay: true),
            items: [
              'assets/images/test.png',
              'assets/images/123.png',
              'assets/images/2223.png',
              'assets/images/test.png',
              'assets/images/test.png'
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorManger.blueBold,
                    ),
                    child: Image.asset(i),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppHeader(title: 'أبحث حسب الفئة'),
              TextButton(
                onPressed: () {
                  Get.to(CategoriesScreen());
                },
                child: Text('عرض الكل',
                    style: TextStyle(color: ColorManger.lColor)),
              )
            ],
          ),
          SizedBox(height: 10.h),
          StreamBuilder<QuerySnapshot>(
              stream: HomeViewModel().getCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return SizedBox(
                    height: 130.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Expanded(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Get.to(const OffersScreen());
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Image.network(snapshot.data!.docs[index].get('image'),height: 80.h),
                                      Text(snapshot.data!.docs[index].get('name'),style: TextStyle(color: ColorManger.lColor,fontSize: 16,fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorManger.blueBold,
                                    borderRadius: BorderRadius.circular(15.sp),
                                  ),
                                  margin: EdgeInsets.only(left: 15.w),
                                  padding: EdgeInsets.all(8.sp),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      'لا توجد فئات حاليا',
                      style: TextStyle(
                        color: ColorManger.lColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  );
                }
              }),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppHeader(title: 'عروض التأجير اليومية'),
              TextButton(
                onPressed: () {
                  Get.to(const OffersScreen());
                },
                child: Text(
                  'عرض الكل',
                  style: TextStyle(
                    color: ColorManger.lColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: HomeViewModel().getOffers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              DetailsScreen(
                                offer: OfferModel(
                                  name: snapshot.data!.docs[index].get('name'),
                                  rating: 0,
                                  price:
                                      snapshot.data!.docs[index].get('price'),
                                  des: snapshot.data!.docs[index].get('des'),
                                  image: snapshot.data!.docs[index].get(
                                    'image',
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 220.h,
                            margin: EdgeInsets.only(bottom: 15.h),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorManger.blueBold,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15.sp),
                                        topLeft: Radius.circular(15.sp),
                                      ),
                                    ),
                                    padding: EdgeInsets.only(top: 30.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          snapshot.data!.docs[index]
                                              .get('image'),
                                          height: 120,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SizedBox(
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  .get('name'),
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: ColorManger.lColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            width: 130,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  flex: 3,
                                ),
                                Divider(
                                  color: ColorManger.liColor,
                                  height: 0,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorManger.blueBold,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15.sp),
                                        bottomLeft: Radius.circular(15.sp),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'متوفرة لدينا',
                                            style: TextStyle(
                                              color: ColorManger.lColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                        Text(
                                          'تبدأ من ',
                                          style: TextStyle(
                                            color: ColorManger.lColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: ColorManger.defaultColor,
                                              borderRadius: BorderRadius.only(
                                                topRight:
                                                    Radius.circular(15.sp),
                                                bottomLeft: Radius.circular(
                                                  15.sp,
                                                ),
                                              ),
                                            ),
                                            height: 100.h,
                                            width: 150.w,
                                            child: Center(
                                              child: Text(
                                                '${snapshot.data!.docs[index].get('price')}\$',
                                                style: TextStyle(
                                                  color: ColorManger.lColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'لليوم ',
                                          style: TextStyle(
                                            color: ColorManger.lColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 10.h),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return Center(
                  child: Text(
                    'لا توجد عروض تأجير حاليا',
                    style: TextStyle(fontSize: 20, color: ColorManger.lColor),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  CategoryModel getCategory(QueryDocumentSnapshot documentSnapshot) {
    CategoryModel categoryModel = CategoryModel(
      name: documentSnapshot.get('name'),
      image: documentSnapshot.get('image'),
    );
    categoryModel.id = documentSnapshot.id;
    return categoryModel;
  }

  OfferModel getOffer(QueryDocumentSnapshot documentSnapshot) {
    OfferModel offerModel = OfferModel(
      rating: documentSnapshot.get('rating'),
      name: documentSnapshot.get('name'),
      price: documentSnapshot.get('price'),
      des: documentSnapshot.get('des'),
      image: documentSnapshot.get('image'),
    );
    offerModel.id = documentSnapshot.id;
    return offerModel;
  }
}
