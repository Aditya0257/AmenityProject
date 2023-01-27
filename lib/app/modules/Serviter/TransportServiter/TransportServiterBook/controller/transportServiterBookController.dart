import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/transportDriverBookingServiter.dart';

class TransportServiterBookingsController extends GetxController{

  List <TransportDriverBookingServiterModel> driverServicesList=[];

  TextEditingController username=TextEditingController();
  TextEditingController mobile=TextEditingController();
  TextEditingController fare=TextEditingController();
  TextEditingController vechicle=TextEditingController();
  TextEditingController vehicleNumber=TextEditingController();
  
}