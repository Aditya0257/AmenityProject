import 'package:amenityfinal/app/modules/Complainant/TransportationSection/TransportationBooking/controller/transportationBookingController.dart';
import 'package:get/get.dart';

class TransportationBookingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransportationBookingController());
  }
}
