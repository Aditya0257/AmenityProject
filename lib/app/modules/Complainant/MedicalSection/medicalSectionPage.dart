import 'package:amenityfinal/app/modules/Complainant/MedicalSection/Controller/medicalSectionPageController.dart';
import 'package:amenityfinal/app/modules/Complainant/MedicalSection/MedicalEmergency/view/medicalEmergency.dart';
import 'package:amenityfinal/app/modules/Complainant/MedicalSection/MedicalQueries/view/medicalQueries.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalSectionPage extends GetView<MedicalSectionPageController> {
  const MedicalSectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: Container()),
        const Expanded(
            flex: 1,
            child: Text(
              'MEDICAL',
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'abcd',
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            )),
        Expanded(
            flex: 4,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 120,
              child: Image.network(
                'https://imgs.search.brave.com/BaclFr7DecG8XeD-ct5XT24A4-Y3Ttgrz4cZIIl8B7Q/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93ZWJz/dG9ja3Jldmlldy5u/ZXQvaW1hZ2VzL2Ns/aXBhcnQtZG9jdG9y/LXBvY2tldC04LnBu/Zw',
                scale: 7,
              ),
            )),
        Expanded(
            flex: 3,
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
                      'Medical Section',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'abcd'),
                    ),
                  ],
                ),
                Row(
                  children: [
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
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Icon(
                      Icons.emergency_outlined,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        MedicalEmergency.launch();
                      },
                      child: Text(
                        'Emergency',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'abcd'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Icon(
                      Icons.question_answer_outlined,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        MedicalQueries.launch();
                      },
                      child: Text(
                        'Queries',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'abcd'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
      ],
    );
  }
}
