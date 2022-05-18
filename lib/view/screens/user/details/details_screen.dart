import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/models/offer_model.dart';
import 'package:rent_your_car/view/screens/user/details/payment_screen.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';
import 'package:rent_your_car/view/widgets/app_button.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.offer}) : super(key: key);
  late OfferModel offer;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin, Helpers {
  late TabController _tabController;
  final double _rate = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل العرض'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
        child: Column(
          children: [
            Image.network(
              widget.offer.image,
              height: 130,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.offer.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.offer.price}\$',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: ColorManger.defaultColor),
                      ),
                      const TextSpan(text: ' '),
                      const TextSpan(
                        text: '/اليوم',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'تفاصيل السيارة :',
                  style: TextStyle(
                      color: ColorManger.lColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Text(
                  widget.offer.des,
                  style: TextStyle(
                      color: ColorManger.liColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ColorManger.liColor,
                    ),
                    Text(
                      'خانيونس',
                      style: TextStyle(
                        color: ColorManger.liColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                RatingBar.builder(
                  unratedColor: ColorManger.liColor,
                  itemSize: 20,
                  initialRating: widget.offer.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: ColorManger.ylColor,
                    size: 8,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rate == rating;
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 15.h,),
            Row(
              children: [
                Text(
                  'تاريخ العرض : ',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorManger.lColor,
                  ),
                ),
                Text(
                  '${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorManger.lColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: ColorManger.blueBold,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.payment_outlined,
                            color: ColorManger.lColor, size: 28),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          'أختر طريقة الدفع',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: ColorManger.lColor),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 45.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManger.lColor,
                                ),
                                borderRadius: BorderRadius.circular(15.sp)),
                            child: AppButton(
                              text: 'دفع الكتروني',
                              color: ColorManger.defaultColor,
                              onPressed: () {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: AppButton(
                            text: 'نقدي',
                            color: ColorManger.defaultColor,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Card(
              color: ColorManger.blueBold,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'الاجمالي',
                                style: TextStyle(
                                  color: ColorManger.lColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              TextSpan(text: '  '),
                              TextSpan(
                                text: 'شامل التوصيل',
                                style: TextStyle(
                                  color: ColorManger.liColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${widget.offer.price}\$ ',
                          style: TextStyle(
                            color: ColorManger.defaultColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppButton(
                        text: 'احجز الان',
                        onPressed: () {
                          Get.to(PayMenScreen(offer: OfferModel(
                            image: widget.offer.image,
                            des: widget.offer.des,
                            price: widget.offer.price,
                            rating: widget.offer.rating,
                            name: widget.offer.name
                          ),));
                        },
                        color: ColorManger.defaultColor)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget carD() => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 80.h,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: ColorManger.blueBold,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Icon(
                    Icons.info_outline,
                    color: ColorManger.liColor,
                    size: 26.sp,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                  width: 300.w,
                  height: 200,
                  child: Text(
                    widget.offer.des,
                    maxLines: 2,
                    style: TextStyle(color: ColorManger.liColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget ownerD() => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 150.h,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
            decoration: BoxDecoration(
              color: ColorManger.blueBold,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: SvgPicture.asset('assets/icons/logo.svg')),
                SizedBox(
                  width: 7.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GOTO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: ColorManger.lColor,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 295.w,
                        child: Text(
                          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            color: ColorManger.liColor,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );
}
