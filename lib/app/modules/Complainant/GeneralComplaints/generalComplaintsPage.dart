// ignore_for_file: avoid_print

import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/Controller/generalComplaintsPageController.dart';
import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralCleaning/view/generalCleaning.dart';
import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralWifi/view/generalWifi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'GeneralAC/view/generalAc.dart';

class GeneralComplaintsPage extends GetView<GeneralComplaintsPageController> {
  static const route = '/general-complainantPage';
  static launch() => Get.toNamed(route);
  const GeneralComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 2, child: SizedBox()),
        Expanded(
            flex: 4,
            child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 120,
                child: Image.network(
                  'https://i.pinimg.com/originals/8c/22/2c/8c222c3f4bc0a92105d90564f0abac4b.png',
                  scale: 4,
                ))),
        Expanded(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'General Complaints',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'abcd'),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 200,
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      AirConditionerComplaints.launch();
                    },
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 50,
                        ),
                        Icon(
                          Icons.air_outlined,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Air Conditioner',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'abcd'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      const Icon(
                        Icons.cleaning_services_outlined,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          CleaningComplaints.launch();
                        },
                        child: const Text(
                          'Cleaning',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'abcd'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      const Icon(
                        Icons.wifi,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          WifiComplaints.launch();
                        },
                        child: const Text(
                          'Wifi',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'abcd'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
