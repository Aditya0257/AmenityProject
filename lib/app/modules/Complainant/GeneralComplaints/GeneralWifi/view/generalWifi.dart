import 'package:amenityfinal/app/models/generalWifiComplaint.dart';
import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralWifi/controller/generalWifiController.dart';
import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralWifi/view/addNewWifiComplaint.dart';
import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralWifi/view/displayWifiComplaint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../utils/colors.dart';

class WifiComplaints extends GetView<GeneralWifiController> {
  static const route = '/general-wifi';
  static launch() => Get.toNamed(route);
  const WifiComplaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/000/095/572/non_2x/vector-dark-wallpaper-design.jpg'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: Container(
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
                                  Navigator.of(context).pop();
                                }),
                          ],
                        ),
                        const Text(
                          'Wifi',
                          style: TextStyle(fontSize: 27, color: Colors.white),
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://st2.depositphotos.com/50337402/47092/v/380/depositphotos_470923054-stock-illustration-adult-man-avatar-short-curly.jpg?forcejpeg=true'),
                            ),
                            const SizedBox(
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
                      margin:
                          const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.black54),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Servitor Information',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(width: double.maxFinite),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 25,
                                      child: Icon(Icons.message),
                                    ),
                                    const SizedBox(
                                      width: 70,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Name of Servitor',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    )),
                SingleChildScrollView(
                  child: SizedBox(
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
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextButton(
                            onPressed: () {
                              AddNewWifiComplaint.launch();
                            },
                            child: const SizedBox(
                              width: double.maxFinite,
                              height: 120,
                              child: Card(
                                color: Colors.orange,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Center(
                                    child: Text(
                                  'Add New',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            height: 400,
                            child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('wifi_complaint')
                                    .snapshots(),
                                builder: (context, snap) {
                                  controller.wifiComplaintsList.clear();
                                  if (!snap.hasData) {
                                    return Align(
                                        alignment: Alignment.bottomCenter,
                                        child: LoadingAnimationWidget
                                            .fourRotatingDots(
                                                color: AppColors.white,
                                                size: 80),
                                      );
                                  }
                                  int indee = 0;
                                  List complaintss = snap.data!.docs;
                                  for (var complaints in complaintss) {
                                    final sender = complaints['sender'];
                                    if (sender.toString() ==
                                        controller.loggedWifi.email
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

                                      controller.wifiComplaintsList.add(
                                          WifiComplaintModel(
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
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(30)),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.black, width: 4),
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
                                                controller.loggedWifi.email
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
                                                      CrossAxisAlignment.start,
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
                                                              .wifiComplaintsList[
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
                                                              .wifiComplaintsList[
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
                                                              .wifiComplaintsList[
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
                                                              .wifiComplaintsList[
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
                                                                  myTransaction
                                                                      .delete(snap
                                                                          .data!
                                                                          .docs[
                                                                              index]
                                                                          .reference);
                                                                });
                                                                controller
                                                                    .wifiComplaintsList
                                                                    .clear();
                                                              },
                                                              child: const Text(
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
                                                              color:
                                                                  Colors.green,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10))),
                                                          child: TextButton(
                                                              onPressed: () {
                                                                controller
                                                                        .touchWifi =
                                                                    index;
                                                                DisplayWifiComplaints
                                                                    .launch();
                                                              },
                                                              child: const Text(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
