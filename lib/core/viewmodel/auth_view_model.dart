import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_your_car/core/services/fireStore_user.dart';
import 'package:rent_your_car/core/utils/helpers.dart';
import 'package:rent_your_car/models/user_model.dart';
import 'package:rent_your_car/view/screens/control_screen.dart';
import 'package:rent_your_car/view/screens/auth/login_screen.dart';
import 'package:rent_your_car/view/screens/auth/register_screen.dart';
import 'package:rent_your_car/view/screens/outBoarding/out_boarding_screen.dart';

class AuthViewModel extends GetxController with Helpers {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late TapGestureRecognizer tapGestureRecognizer;
  late TextEditingController emailLoginEditingController;
  late TextEditingController passwordLoginEditingController;

  late TextEditingController nameRegisterEditingController;
  late TextEditingController emailRegisterEditingController;
  late TextEditingController passwordRegisterEditingController;
  late TextEditingController phoneRegisterEditingController;
  late TextEditingController imageRegisterEditingController;

  bool obText = true;

  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  String? get uId => _user.value?.uid;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    tapGestureRecognizer = TapGestureRecognizer();
    emailLoginEditingController = TextEditingController();
    passwordLoginEditingController = TextEditingController();

    nameRegisterEditingController = TextEditingController();
    emailRegisterEditingController = TextEditingController();
    passwordRegisterEditingController = TextEditingController();
    phoneRegisterEditingController = TextEditingController();
    imageRegisterEditingController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tapGestureRecognizer.dispose();
    emailLoginEditingController.dispose();
    passwordLoginEditingController.dispose();

    nameRegisterEditingController.dispose();
    emailRegisterEditingController.dispose();
    passwordRegisterEditingController.dispose();
    phoneRegisterEditingController.dispose();
    imageRegisterEditingController.dispose();
  }

  void signInWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailLoginEditingController.text,
          password: passwordLoginEditingController.text);
      showSnackBar(context, message: 'تم تسجيل الدخول بنجاح');
      Get.offAll(ControlScreen());
    } catch (e) {
      showSnackBar(context, message: '$e', error: true);
    }
  }


  oText(){
    obText == false;
    update();
  }

  void createAccountWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: emailRegisterEditingController.text, password: passwordRegisterEditingController.text)
          .then((user) async {
        saveUser(user);
      });
      showSnackBar(context, message: 'تم تسجيل الحساب بنجاح');

      Get.offAll(LoginScreen());
    } catch (e) {
      print(e);
      showSnackBar(context, message: 'هناك خطا ما',error: true);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      uId: user.user!.uid,
      email: user.user!.email,
      image: '',
      name: nameRegisterEditingController.text,
      phone: phoneRegisterEditingController.text,
      role: false,
    );
    await FireStoreUser().addUserToFireStore(userModel);
  }



  bool checkDataLogin(BuildContext context) {
    if (emailLoginEditingController.text.isNotEmpty &&
        passwordLoginEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'أدخل بيانات صحيحة', error: true);
    return false;
  }

  bool checkDataRegister(BuildContext context) {
    if (emailRegisterEditingController.text.isNotEmpty &&
        passwordRegisterEditingController.text.isNotEmpty &&
        nameRegisterEditingController.text.isNotEmpty &&
        phoneRegisterEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'أدخل بيانات صحيحة', error: true);
    return false;
  }

  void navigateToRegister() {
    Get.to(RegisterScreen());
  }
  void navigateToLogin() {
    Get.to(OutBoardingScreen());
  }


  void clear() {
    emailRegisterEditingController.text = '';
    passwordRegisterEditingController.text = '';
    nameRegisterEditingController.text = '';
    phoneRegisterEditingController.text = '';
    emailLoginEditingController.text = '';
    passwordLoginEditingController.text = '';
  }

}
