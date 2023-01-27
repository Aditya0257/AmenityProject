import 'package:get/get.dart';

import '../controller/generalAcController.dart';

class GeneralAirConditionerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GeneralAirConditionerController());
  }
}
