import 'package:get/get.dart';

import '../controller/generalServiterHomeController.dart';

class GeneralServiterHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GeneralServiterHomeController());
  }
}
