import 'package:amenityfinal/app/models/medicalEmergencyServiterComplaint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalEmergencyServicesController extends GetxController{

   List<MedicalEmergencyServiterComplaintModel> emergencyMedicalList =[];

   TextEditingController username=TextEditingController();
  TextEditingController mobile=TextEditingController();
  TextEditingController service=TextEditingController();
  TextEditingController hospital=TextEditingController();
  TextEditingController vehicleNumber=TextEditingController();

}