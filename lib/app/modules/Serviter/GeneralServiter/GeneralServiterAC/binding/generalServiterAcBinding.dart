import 'package:get/get.dart';

import '../controller/generalServiterAcController.dart';

class AirConditionerServicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AirConditionerServicesController());
  }
}
