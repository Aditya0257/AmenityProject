import 'package:get/get.dart';

import '../Controller/medicalSectionPageController.dart';

class MedicalSectionPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicalSectionPageController);
  }
}
