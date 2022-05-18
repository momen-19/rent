import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/core/viewmodel/home_view_model.dart';
import 'package:rent_your_car/models/offer_model.dart';
import 'package:rent_your_car/view/screens/app/offers/add_offer_screen.dart';
import 'package:rent_your_car/view/screens/app/offers/update_offer_screen.dart';
import 'package:rent_your_car/view/screens/user/details/details_screen.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> with Helpers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('العروض'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: HomeViewModel().getOffers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'هنا تظهر عروض اليوم',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorManger.lColor,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 15.h),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: ListTile(
                            onTap: () {
                              Get.to(DetailsScreen(
                                  offer: OfferModel(
                                      name: snapshot.data!.docs[index]
                                          .get('name'),
                                      rating: 0,
                                      price: snapshot.data!.docs[index]
                                          .get('price'),
                                      des:
                                          snapshot.data!.docs[index].get('des'),
                                      image: snapshot.data!.docs[index]
                                          .get('image'))));
                            },
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 5.w),
                            tileColor: ColorManger.blueBold,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            leading: Image.network(
                                snapshot.data!.docs[index].get('image')),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data!.docs[index].get('name'),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManger.lColor,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Expanded(
                                child: Text(
                                    '${snapshot.data!.docs[index].get('price')}\$ لليوم',
                                    style: TextStyle(
                                        color: ColorManger.defaultColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14))),
                            subtitle: Text(
                                snapshot.data!.docs[index].get('des'),
                                style: TextStyle(
                                    fontSize: 15, color: ColorManger.lColor),
                                maxLines: 1),
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
        },
      ),
    );
  }

  OfferModel getOffer(QueryDocumentSnapshot documentSnapshot) {
    OfferModel offerModel = OfferModel(
        name: documentSnapshot.get('name'),
        image: documentSnapshot.get('image'),
        des: documentSnapshot.get('des'),
        price: documentSnapshot.get('price'),
        rating: 0);
    offerModel.id = documentSnapshot.id;
    return offerModel;
  }

  Future<void> deleteOffer({required String path}) async {
    bool deleted = await HomeViewModel().deleteOffer(path);

    String message = deleted ? 'تم الحذف بنجاح' : ' فشل الحذف';
    if (deleted) {
      showSnackBar(context, message: message, error: !deleted);
    }
  }
}
