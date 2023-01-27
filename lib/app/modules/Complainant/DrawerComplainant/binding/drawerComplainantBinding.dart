import 'package:amenityfinal/app/modules/Complainant/DrawerComplainant/controller/chattingSectionController.dart';
import 'package:amenityfinal/app/modules/Complainant/DrawerComplainant/controller/drawerComplainantController.dart';
import 'package:amenityfinal/app/modules/Complainant/DrawerComplainant/controller/mainBackgroundController.dart';
import 'package:get/get.dart';

class DrawerComplainantBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DrawerComplainantController());
    Get.lazyPut(() => ChattingSectionController());
    Get.lazyPut(() => MainBackgroundController());
  }
}
