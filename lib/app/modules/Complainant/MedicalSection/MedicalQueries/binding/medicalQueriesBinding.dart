import 'package:amenityfinal/app/modules/Complainant/MedicalSection/MedicalQueries/controller/medicalQueriesController.dart';
import 'package:get/get.dart';

class MedicalQueriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicalQueriesController());
  }
}
