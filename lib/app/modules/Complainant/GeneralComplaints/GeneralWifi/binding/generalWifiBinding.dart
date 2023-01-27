import 'package:get/get.dart';

import '../controller/generalWifiController.dart';

class GeneralWifiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GeneralWifiController());
  }
}
