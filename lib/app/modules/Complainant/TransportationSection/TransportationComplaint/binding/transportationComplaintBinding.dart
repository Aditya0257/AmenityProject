import 'package:get/get.dart';

import '../controller/transportationComplaintController.dart';

class TransportationComplaintBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransportationComplaintController());
  }
}
