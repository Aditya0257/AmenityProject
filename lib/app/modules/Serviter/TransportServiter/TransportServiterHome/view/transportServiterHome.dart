import 'package:amenityfinal/app/modules/Serviter/LoginAndSignup/controller/servitorLoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/transportServiterHomeController.dart';

class TransportServiterHome extends GetView<TransportServiterHomeController> {
  static const route = '/transportServiter-home';
  static launch() => Get.toNamed(route);
  const TransportServiterHome({Key? key}) : super(key: key);

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
          builder: (serviterController) {
            return Text(serviterController.username,
                style: TextStyle(color: Colors.white, fontSize: 40));
          },
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.all(0),
          child: Image(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2014/04/02/16/18/bus-306857__340.png',
                scale: 2),
          ),
        )
      ],
    );
  }
}
