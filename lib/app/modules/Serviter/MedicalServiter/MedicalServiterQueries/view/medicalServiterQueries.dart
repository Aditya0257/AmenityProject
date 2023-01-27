import 'package:amenityfinal/app/models/medicalQueriesServiterComplaint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/TextButton.dart';
import '../controller/medicalServiterQueriesController.dart';
import 'doctorName.dart';

class MedicalQueriesServices extends GetView<MedicalQueriesServicesController> {
  static const route = '/medicalQueries-services';
  static launch() => Get.toNamed(route);
  const MedicalQueriesServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'Queries',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 20,
          ),
          Button(
            // navigator_class: doctor_name(),
            onPressed: () {
              DoctorName.launch();
            },
            width: MediaQuery.of(context).size.width * .90,
            height: 100,
            border: 30,
            color: Colors.blueAccent,
            child: Center(
                child: Text(
              'Add New',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500),
            )),
          ),
          GetBuilder<MedicalQueriesServicesController>(
              init: MedicalQueriesServicesController(),
              builder: (controller) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  width: double.maxFinite,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('doctor')
                        .snapshots(),
                    builder: (context, snapshot) {
                      controller.queriesMedicalList.clear();
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
                          controller.queriesMedicalList.add(
                              MedicalQueriesServiterComplaintModel(
                                  name, mobile, service, hospital, vehicle));
                        }
                      }
                      return ListView.builder(
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Name of Doctor: ',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        controller
                                            .queriesMedicalList[index].username,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Email Address: ',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        controller
                                            .queriesMedicalList[index].email,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Speciality: ',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        controller.queriesMedicalList[index]
                                            .speciality,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            .queriesMedicalList[index].hospital,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Phone number: ',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        controller
                                            .queriesMedicalList[index].mobile,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      )
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .runTransaction((Transaction
                                                myTransaction) async {
                                          await myTransaction.delete(snapshot
                                              .data!.docs[index].reference);
                                        });
                                        controller.queriesMedicalList
                                            .removeAt(index);
                                      },
                                      child: Container(
                                          width: 60,
                                          height: 40,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.redAccent),
                                          child: const Center(
                                              child: Text(
                                            'Delete',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )))),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
