import 'package:get/get.dart';

import '../controller/generalServiterWifiController.dart';


class WifiServicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WifiServicesController());
  }
}
