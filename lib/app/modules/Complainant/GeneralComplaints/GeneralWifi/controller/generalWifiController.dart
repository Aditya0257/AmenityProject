import 'package:amenityfinal/app/models/generalWifiComplaint.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralWifiController extends GetxController {

  late User loggedWifi;

  @override
  void onInit() {
    getcurrentuser();
    super.onInit();  
  }

  void getcurrentuser() async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedWifi = user;
      }
    } catch (err) {
      print(err.toString());
    }
  }

  int wifiIndi = 0;
  var items = ['Girls Hostel', 'Boys Hostel', 'Other'];

  List<String> wifiRoomList = [];
  List<String> wifiDateList = [];
  List<String> wifiTimeList = [];

  TextEditingController wifiRoomController = TextEditingController();
  TextEditingController wifiDateController = TextEditingController();
  TextEditingController wifiTimeController = TextEditingController();


  final x = 'Girls Hostel'.obs;
  String get dropdownvalue => x.value;
  dropDownValueUpdate(value) {
    x(value);
  }


  TextEditingController username = TextEditingController();
  TextEditingController sender = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController floornumber = TextEditingController();
  TextEditingController roomnumber = TextEditingController();
  TextEditingController cleaningtype = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController timing = TextEditingController();

  List<WifiComplaintModel> wifiComplaintsList = [];
  late int touchWifi;
}
