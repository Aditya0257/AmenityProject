import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/transportNoticeDataServiter.dart';

class TransportServiterNoticeController extends GetxController{

  late User loggeduser;

int touchTransportServiter = 0;
List<TransportNoticeDataServiterModel> transportServiterNoticeList = [];
TextEditingController subjectController = TextEditingController();
TextEditingController bodyController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  void onInit() {
    getcurrentuser();
    super.onInit();
  }

  void getcurrentuser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggeduser = user;
        print(loggeduser.email);
      }
    } catch (err) {
      //print(err.toString());
    }
  }





}