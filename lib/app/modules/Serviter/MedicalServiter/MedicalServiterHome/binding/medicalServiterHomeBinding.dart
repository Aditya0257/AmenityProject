import 'package:get/get.dart';

import '../controller/medicalServiterHomeController.dart';

class MedicalServiterHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicalServiterHomeController());
  }
}
