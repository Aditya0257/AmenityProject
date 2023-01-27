import 'package:amenityfinal/app/modules/Complainant/TransportationSection/TransportationNotice/controller/transportationNoticeController.dart';
import 'package:get/get.dart';

class TransportationNoticeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransportationNoticeController());
  }
}
