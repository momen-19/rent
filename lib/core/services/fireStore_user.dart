
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_your_car/models/user_model.dart';

class FireStoreUser{
  final CollectionReference _userCollection = FirebaseFirestore.instance.collection('Users');


  Future<void> addUserToFireStore(UserModel userModel)async{
    return await _userCollection.doc(userModel.uId).set(userModel.toJson());
  }

  getCurrentUser(String uid) {}


}