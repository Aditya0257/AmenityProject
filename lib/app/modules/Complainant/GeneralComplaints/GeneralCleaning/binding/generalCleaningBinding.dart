import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralCleaning/controller/generalCleaningController.dart';
import 'package:get/get.dart';

class GeneralCleaningBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GeneralCleaningController());
  }
}
