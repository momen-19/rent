import 'package:get/get.dart';
import 'package:rent_your_car/core/viewmodel/auth_view_model.dart';
import 'package:rent_your_car/core/viewmodel/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
  }
}
