import 'package:amenityfinal/app/models/medicalEmergencyComplaint.dart';
import 'package:amenityfinal/app/modules/Complainant/MedicalSection/MedicalEmergency/controller/medicalEmergencyController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalEmergency extends GetView<MedicalEmergencyController> {
  static const route = '/generalMedical-emergency';
  static launch() => Get.toNamed(route);
  const MedicalEmergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                  const Text(
                    'Emergency',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Row(
                    children: const [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://st2.depositphotos.com/50337402/47092/v/380/depositphotos_470923054-stock-illustration-adult-man-avatar-short-curly.jpg?forcejpeg=true'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .6,
              width: double.maxFinite,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('emergency')
                    .snapshots(),
                builder: (context, snapshot) {
                  controller.emergencyComplaintList.clear();
                  int indee = 0;
                  if (snapshot.hasData) {
                    final notice = snapshot.data!.docs;
                    for (var message in notice) {
                      indee++;
                      final name = message['username'];
                      final mobile = message['mobile'];
                      final service = message['service'];
                      final hospital = message['hospital'];
                      final vehicle = message['vehicle'];
                      controller.emergencyComplaintList.add(
                          MedicalEmergencyComplaintModel(
                              name, mobile, service, hospital, vehicle));
                    }
                  }
                  return indee == 0
                      ? Center(
                          child: Image(
                              image: NetworkImage(
                                  'https://www.freepnglogos.com/uploads/doctor-png/doctor-icon-33.png')))
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: indee,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Container(
                                width: double.maxFinite,
                                height: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 4),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Amb. Driver: ',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller
                                              .emergencyComplaintList[index]
                                              .username,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Email/Phone number: ',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller
                                              .emergencyComplaintList[index]
                                              .mobile,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          softWrap: false,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Service type: ',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller
                                              .emergencyComplaintList[index]
                                              .type,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          softWrap: false,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Hospital: ',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller
                                              .emergencyComplaintList[index]
                                              .hospital,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          softWrap: false,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Vehicle number: ',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller
                                              .emergencyComplaintList[index]
                                              .vehicle,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          softWrap: false,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
