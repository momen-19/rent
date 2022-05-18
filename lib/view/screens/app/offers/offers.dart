import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/core/viewmodel/home_view_model.dart';
import 'package:rent_your_car/models/offer_model.dart';
import 'package:rent_your_car/view/screens/app/offers/add_offer_screen.dart';
import 'package:rent_your_car/view/screens/app/offers/update_offer_screen.dart';
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
        title: Text('عروض التأجير'),
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
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    snapshot.data!.docs[index].get('name'),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ColorManger.lColor,
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    '${snapshot.data!.docs[index].get('price')}\$ لليوم',
                                    style: TextStyle(
                                      color: ColorManger.defaultColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                            subtitle: Text(
                                snapshot.data!.docs[index].get('des'),
                                style: TextStyle(
                                    fontSize: 15, color: ColorManger.lColor),
                                maxLines: 1),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateOfferScreen(
                                                  offer: getOffer(snapshot
                                                      .data!.docs[index])),
                                        ));
                                  },
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    color: Colors.green.shade400,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await deleteOffer(
                                        path: snapshot.data!.docs[index].id);
                                  },
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.red.shade800,
                                  ),
                                ),
                              ],
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
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: Row(
          children: [
            FloatingActionButton(
              elevation: 5,
              onPressed: () {
                Get.to(AddOfferScreen());
              },
              child: Icon(Icons.add),
            ),
            SizedBox(width: 5.w),
            Text(
              'اضافة عرض جديد',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
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
