import 'package:get/get.dart';

import '../controller/transportServiterBookController.dart';

class TransportServiterBookingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransportServiterBookingsController());
  }
}
