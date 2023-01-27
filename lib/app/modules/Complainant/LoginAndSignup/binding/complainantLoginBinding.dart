import 'package:get/get.dart';

import '../controller/complainantLoginController.dart';
import '../controller/complainantSignupController.dart';

class ComplainantLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComplainantLoginController());
     Get.lazyPut(() => ComplainantSignupController());
  }
}