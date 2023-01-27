import 'package:get/get.dart';

import '../controller/generalServiterCleaningController.dart';


class CleaningServicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CleaningServicesController());
  }
}
