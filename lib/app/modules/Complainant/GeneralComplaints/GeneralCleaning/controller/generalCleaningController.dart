import 'package:amenityfinal/app/models/generalCleaningComplaint.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralCleaningController extends GetxController {
  final _auth = FirebaseAuth.instance;

  List<CleaningComplaintModel> cleaningComplaintsList = [];
  late int touchCleaning;
  late User loggedClean;

  @override
  void onInit() {
    getcurrentuser();
    super.onInit();
  }

  void getcurrentuser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedClean = user;
      }
    } catch (e) {
      print(e);
    }
  }

  int indi = 0;
  List<String> roomList = [];
  List<String> dateList = [];
  List<String> timeList = [];
  List<String> cleaningTypeList = [];

  
  var items = ['Girls Hostel', 'Boys Hostel', 'Other'];

  TextEditingController roomController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController cleaningTypeController = TextEditingController();

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
}
