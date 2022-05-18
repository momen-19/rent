import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/models/category_model.dart';
import 'package:rent_your_car/models/offer_model.dart';
import 'package:rent_your_car/models/payment.dart';

class HomeViewModel extends GetxController {

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);


  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> get offerModel => _offerModel;

  final List<CategoryModel> _categoryModel = [];
  final List<CategoryModel> _offerModel = [];

  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _offersCollectionRef =
  FirebaseFirestore.instance.collection('Offers');

  final CollectionReference _paymentCollectionRef =
  FirebaseFirestore.instance.collection('Payment');

  HomeViewModel() {
    getCategory();
    getOffers();
  }


  Future<bool> createCategory({required CategoryModel categoryModel}) async {
    _loading.value = true;
    return _categoryCollectionRef
        .add(categoryModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateCategory({required CategoryModel category}) async {
    _loading.value = true;
    return _categoryCollectionRef
        .doc(category.id)
        .update(category.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteCategory(String path) async {
    return _categoryCollectionRef
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> getCategory() async* {
    yield* _categoryCollectionRef.snapshots();
    update();
  }

  Future<bool> createOffer({required OfferModel offerModel}) async {
    return _offersCollectionRef
        .add(offerModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }


  Future<bool> updateOffer({required OfferModel offer}) async {
    return _offersCollectionRef
        .doc(offer.id)
        .update(offer.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> getOffer({required OfferModel offer}) async {
    return _offersCollectionRef
        .doc(offer.id)
        .get()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteOffer(String path) async {
    return _offersCollectionRef
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> getOffers() async* {
    yield* _offersCollectionRef.snapshots();
    update();
  }

  Future<bool> payment({required PaymentModel paymentModel}) async {
    return _paymentCollectionRef
        .add(paymentModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> getPay() async* {
    yield* _paymentCollectionRef.snapshots();
    update();
  }

}
