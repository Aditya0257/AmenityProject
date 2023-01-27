import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackbar(message) {
  Get.showSnackbar(GetSnackBar(
    duration: Duration(seconds: 3),
    backgroundColor: const Color(0xFF7286D3),
    messageText: Text(
      message,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  ));
}
