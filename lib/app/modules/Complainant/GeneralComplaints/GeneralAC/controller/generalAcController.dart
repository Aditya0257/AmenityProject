import 'package:amenityfinal/app/models/generalAcComplaint.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralAirConditionerController extends GetxController {
  // String dropdownvalue = 'Girls Hostel';
  var items = ['Girls Hostel', 'Boys Hostel', 'Other'];

  TextEditingController username = TextEditingController();
  TextEditingController sender = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController floornumber = TextEditingController();
  TextEditingController roomnumber = TextEditingController();
  TextEditingController cleaningtype = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController timing = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    getcurrentuser();
    super.onInit();
  }

  void getcurrentuser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedAir = user;
      }
    } catch (e) {
      print(e);
    }
  }

  List<AirConditionerComplaintModel> airComplaintsList = [];
  late int touchAir;
  late User loggedAir;

  final x = 'Girls Hostel'.obs;
  String get dropdownvalue => x.value;
  dropDownValueUpdate(value) {
    x(value);
  }
}
