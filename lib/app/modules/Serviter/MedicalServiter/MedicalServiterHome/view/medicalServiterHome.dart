import 'package:amenityfinal/app/modules/Serviter/LoginAndSignup/controller/servitorLoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/medicalServiterHomeController.dart';

class MedicalServiterHome extends GetView<MedicalServiterHomeController> {
  static const route = '/medicalServiter-home';
  static launch() => Get.toNamed(route);
  const MedicalServiterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 150,
        ),
        Text('Welcome',
            style: TextStyle(
                color: Colors.blueAccent, fontSize: 70, fontFamily: 'style')),
        SizedBox(
          height: 10,
        ),
        GetBuilder<ServiterLoginController>(
          init: ServiterLoginController(),
          builder: (servitorController) {
            return Text(servitorController.username,
                style: TextStyle(color: Colors.white, fontSize: 40));
          },
        ),
        Container(
          margin: EdgeInsets.all(0),
          child: Image(
            image: NetworkImage(
                'https://www.freepnglogos.com/uploads/medical-logo-png-5.png'),
          ),
        )
      ],
    );
  }
}
