import 'package:amenityfinal/app/modules/Serviter/MedicalServiter/MedicalServiterQueries/controller/medicalServiterQueriesController.dart';
import 'package:get/get.dart';

class MedicalQueriesServicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicalQueriesServicesController());
  }
}
