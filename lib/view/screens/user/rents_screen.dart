import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_your_car/core/viewmodel/home_view_model.dart';
import 'package:rent_your_car/models/payment.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';

class RentsScreen extends StatefulWidget {
  RentsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RentsScreen> createState() => _RentsScreenState();
}

class _RentsScreenState extends State<RentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h,),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: HomeViewModel().getPay(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  }else if(snapshot.hasData){
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.sp)
                            ),
                            tileColor: ColorManger.blueBold,
                            leading:
                            Icon(Icons.check_circle_outline, color: Colors.green),
                            title: Text(
                                snapshot.data!.docs[index].get('name'),
                                style: TextStyle(color: ColorManger.lColor)
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                    snapshot.data!.docs[index].get('nameCar'),
                                    style: TextStyle(color: ColorManger.lColor)
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                    '${snapshot.data!.docs[index].get('price')} \$',
                                    style: TextStyle(color: ColorManger.defaultColor)
                                ),
                              ],
                            ),
                            trailing: Container(
                              width: 80.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: Center(child: Text('مدفوعة',style: TextStyle(color: ColorManger.lColor))),
                            ),
                          ),
                        );
                      },
                    );
                  }else{
                    return Center(
                      child: Text('لا توجد حجوزات حاليا',style: TextStyle(color: ColorManger.lColor,fontSize: 18.sp,fontWeight: FontWeight.bold)),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  PaymentModel getOffer(QueryDocumentSnapshot documentSnapshot) {
    PaymentModel paymentModel = PaymentModel(
      nameCar: documentSnapshot.get('nameCar'),
      price: documentSnapshot.get('price'),
      name: documentSnapshot.get('name'),
      cvv: documentSnapshot.get('cvv'),
      date: documentSnapshot.get('date'),
      number: documentSnapshot.get('number'),
    );
    paymentModel.id = documentSnapshot.id;
    return paymentModel;
  }
}
