import 'package:get/get.dart';

import '../controller/transportServiterHomeController.dart';

class TransportServiterHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransportServiterHomeController());
  }
}
