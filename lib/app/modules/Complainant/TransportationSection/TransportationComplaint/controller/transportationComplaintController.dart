import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/complaintClass.dart';

class TransportationComplaintController extends GetxController {
  final _auth = FirebaseAuth.instance;
  late User loggedUser;
  int touch = 0;
  List<ComplaintClassModel> transportationComplaintList = [];

  TextEditingController problem = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController vehicle = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  void onInit() {
    getcurrentuser();
    super.onInit();
  }

  void getcurrentuser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
}
