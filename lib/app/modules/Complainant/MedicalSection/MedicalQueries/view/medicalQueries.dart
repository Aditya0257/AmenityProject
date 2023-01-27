import 'package:amenityfinal/app/models/medicalQueriesComplaint.dart';
import 'package:amenityfinal/app/modules/Complainant/MedicalSection/MedicalQueries/controller/medicalQueriesController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalQueries extends GetView<MedicalQueriesController> {
  static const route = '/generalMedical-queries';
  static launch() => Get.toNamed(route);
  const MedicalQueries({Key? key}) : super(key: key);

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
                    'Queries',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 120,
                        child: Image.network(
                          'https://st2.depositphotos.com/50337402/47092/v/380/depositphotos_470923054-stock-illustration-adult-man-avatar-short-curly.jpg?forcejpeg=true',
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            return child;
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(0.04),
                                radius: 120,
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
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
                stream:
                    FirebaseFirestore.instance.collection('doctor').snapshots(),
                builder: (context, snapshot) {
                  controller.queriesComplaintList.clear();
                  int indee = 0;
                  if (snapshot.hasData) {
                    final notice = snapshot.data!.docs;
                    for (var message in notice) {
                      indee++;
                      final name = message['username'];
                      final mobile = message['mobile'];
                      final service = message['email'];
                      final hospital = message['hospital'];
                      final vehicle = message['special'];
                      controller.queriesComplaintList.add(
                          MedicalQueriesComplaintModel(
                              name, mobile, service, hospital, vehicle));
                    }
                  }
                  return indee == 0
                      ? Center(
                          child: Image(
                              image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2020/08/03/09/43/medical-5459654__340.png')))
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
                                          'Name of Doctor: ',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller.queriesComplaintList[index]
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
                                          'Email Address: ',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller.queriesComplaintList[index]
                                              .email,
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
                                          'Speciality: ',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller.queriesComplaintList[index]
                                              .speciality,
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
                                          controller.queriesComplaintList[index]
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
                                          'Phone number: ',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller.queriesComplaintList[index]
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
