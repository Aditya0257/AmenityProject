import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/Controller/generalComplaintsPageController.dart';
import 'package:get/get.dart';

class GeneralComplaintsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GeneralComplaintsPageController());
  }
}
