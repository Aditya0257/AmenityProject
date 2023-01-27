import 'package:amenityfinal/app/modules/LoginAsOption/controller/loginAsOptionController.dart';
import 'package:get/get.dart';

class LoginAsOptionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginAsOptionController());
  }
}
