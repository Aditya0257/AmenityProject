import 'package:amenityfinal/app/models/generalAcComplaint.dart';
import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralAC/controller/generalAcController.dart';
import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralAC/view/addNewAcComplaint.dart';
import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralAC/view/displayAcComplaint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../utils/colors.dart';
import '../../../../../../widgets/TextButton.dart';
import '../../../../../../widgets/background_image.dart';

class AirConditionerComplaints
    extends GetView<GeneralAirConditionerController> {
  static const route = '/displayAC-complaint';

  const AirConditionerComplaints({super.key});
  static launch() => Get.toNamed(route);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: background(
            link:
                'https://static.vecteezy.com/system/resources/previews/000/095/572/non_2x/vector-dark-wallpaper-design.jpg',
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: SizedBox(
                        width: double.maxFinite,
                        height: double.maxFinite,
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
                                      Get.back();
                                    }),
                              ],
                            ),
                            const Text(
                              'Air Conditioner',
                              style:
                                  TextStyle(fontSize: 27, color: Colors.white),
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
                    ),
                    SizedBox(
                        width: double.maxFinite,
                        height: 260,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 35),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.black54),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Servitor Information',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(width: double.maxFinite),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 70,
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 25,
                                          child: IconButton(
                                            icon: const Icon(Icons.call),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR59-m3AT7SI3Qth0e_hD22i0P0k4YukBJvsptTMlvAat7wqJTag2RH7aFB1upp6vVUbU8&usqp=CAU'),
                                      radius: 35,
                                    ),
                                    Row(
                                      children: const [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 25,
                                          child: Icon(Icons.message),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                'Name of Servitor',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      width: double.maxFinite,
                      height: 600,
                      child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Complaint Booking',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Button(
                                onPressed: () {
                                  AddNewAirConditionerComplaint.launch();
                                },
                                width: double.maxFinite,
                                height: 120,
                                border: 30,
                                color: Colors.orange,
                                child: const Text(
                                  'Add New',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                )),
                            SizedBox(
                              width: double.maxFinite,
                              height: 400,
                              child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('air_complaint')
                                      .snapshots(),
                                  builder: (context, snap) {
                                    controller.airComplaintsList.clear();
                                    if (!snap.hasData) {
                                      return Align(
                                        alignment: Alignment.bottomCenter,
                                        child: LoadingAnimationWidget
                                            .fourRotatingDots(
                                                color: AppColors.white,
                                                size: 80),
                                      );
                                      //   GetSnackBar(
                                      //     title: 'null ',
                                      //     message: 'no data here...',
                                      //     icon: const Icon(Icons.refresh),
                                      //     duration: const Duration(seconds: 3),
                                    }
                                    int indee = 0;
                                    List complaintss = snap.data!.docs;
                                    for (var complaints in complaintss) {
                                      final sender = complaints['sender'];
                                      if (sender ==
                                          controller.loggedAir.email
                                              .toString()) {
                                        indee++;
                                        final username = complaints['username'];
                                        final timing = complaints['timing'];
                                        final roomnumber =
                                            complaints['roomnumber'];
                                        final mobile = complaints['mobile'];
                                        final hostel = complaints['hostel'];
                                        final floor = complaints['floor'];
                                        final date = complaints['date'];
                                        final cleaningtype =
                                            complaints['cleaningtype'];
                                        final block = complaints['block'];

                                        controller.airComplaintsList.add(
                                            AirConditionerComplaintModel(
                                                username,
                                                mobile,
                                                hostel,
                                                block,
                                                floor,
                                                roomnumber,
                                                cleaningtype,
                                                date,
                                                timing));
                                      }
                                    }
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: indee,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 80, horizontal: 10),
                                          child: Container(
                                            width: 300,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(30)),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 4),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      'https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                                                ),
                                                const SizedBox(
                                                  height: 9,
                                                ),
                                                Text(
                                                  controller.loggedAir.email
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                                const SizedBox(
                                                  height: 9,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Text(
                                                            'Room No.: ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blueAccent,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            controller
                                                                .airComplaintsList[
                                                                    index]
                                                                .room,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .blueAccent,
                                                                fontSize: 15),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Text(
                                                            'Preferred Date: ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blueAccent,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            controller
                                                                .airComplaintsList[
                                                                    index]
                                                                .date,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .blueAccent,
                                                                fontSize: 15),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Text(
                                                            'Preffered Timing: ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blueAccent,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            controller
                                                                .airComplaintsList[
                                                                    index]
                                                                .time,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .blueAccent,
                                                                fontSize: 15),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Text(
                                                            'Remarks: ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blueAccent,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            controller
                                                                .airComplaintsList[
                                                                    index]
                                                                .cleaningtype,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .blueAccent,
                                                                fontSize: 15),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 90,
                                                            height: 40,
                                                            decoration: const BoxDecoration(
                                                                color: Colors
                                                                    .redAccent,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  await FirebaseFirestore
                                                                      .instance
                                                                      .runTransaction(
                                                                          (Transaction
                                                                              myTransaction) async {
                                                                    myTransaction.delete(snap
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .reference);
                                                                  });
                                                                  controller
                                                                      .airComplaintsList
                                                                      .clear();
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Delete',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20),
                                                                )),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Container(
                                                            width: 90,
                                                            height: 40,
                                                            decoration: const BoxDecoration(
                                                                color: Colors
                                                                    .green,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: TextButton(
                                                                onPressed: () {
                                                                  controller
                                                                          .touchAir =
                                                                      index;
                                                                  DisplayAcComplaints
                                                                      .launch();
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Details',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20),
                                                                )),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
