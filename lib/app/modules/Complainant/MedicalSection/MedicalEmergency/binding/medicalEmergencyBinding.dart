import 'package:amenityfinal/app/modules/Complainant/MedicalSection/MedicalEmergency/controller/medicalEmergencyController.dart';
import 'package:get/get.dart';

class MedicalEmergencyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicalEmergencyController());
  }
}
