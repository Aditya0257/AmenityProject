import 'package:amenityfinal/app/modules/Administrative/controller/administrativeLoginController.dart';
import 'package:amenityfinal/app/modules/Administrative/controller/administrativeMainPageController.dart';
import 'package:get/get.dart';

class AdministrativeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdministrativeLoginPageController());
    Get.lazyPut(() => AdministrativeMainPageController());
  }
}
