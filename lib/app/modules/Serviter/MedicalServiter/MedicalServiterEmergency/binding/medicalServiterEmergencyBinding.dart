import 'package:amenityfinal/app/modules/Serviter/MedicalServiter/MedicalServiterEmergency/controller/medicalServiterEmergencyController.dart';
import 'package:get/get.dart';

class MedicalEmergencyServicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicalEmergencyServicesController());
  }
}
