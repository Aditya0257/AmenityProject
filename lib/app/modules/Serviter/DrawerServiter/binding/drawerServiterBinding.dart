import 'package:amenityfinal/app/modules/Serviter/DrawerServiter/controller/drawerServiterController.dart';
import 'package:amenityfinal/app/modules/Serviter/LoginAndSignup/controller/servitorLoginController.dart';
import 'package:get/get.dart';

class DrawerServitorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiterLoginController());
  }
}
