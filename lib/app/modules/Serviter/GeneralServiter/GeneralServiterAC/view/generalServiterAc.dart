import 'package:amenityfinal/app/models/generalAcServiterComplaint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../utils/colors.dart';
import '../controller/generalServiterAcController.dart';
import 'displayGeneralServiterAc.dart';

class AirConditionerServices extends GetView<AirConditionerServicesController> {
  static const route = '/generalAc-services';
  static launch() => Get.toNamed(route);
  const AirConditionerServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Air Conditioner',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500,
                letterSpacing: 2),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 300,
            height: 10,
            child: Divider(
              color: Colors.grey,
              thickness: 2,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GetBuilder<AirConditionerServicesController>(
              init: AirConditionerServicesController(),
              builder: (controller) {
                return SizedBox(
                  width: double.maxFinite,
                  height: 600,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('air_complaint')
                          .snapshots(),
                      builder: (context, snap) {
                        controller.airConditionerServitorList.clear();
                        if (!snap.hasData) {
                          return LoadingAnimationWidget.fourRotatingDots(
                            color: AppColors.white, size: 80);
                        }
                        int indee = 0;
                        List complaintss = snap.data!.docs;
                        for (var complaints in complaintss) {
                          final sender = complaints['sender'];
                          indee++;
                          final username = complaints['username'];
                          final timing = complaints['timing'];
                          final roomnumber = complaints['roomnumber'];
                          final mobile = complaints['mobile'];
                          final hostel = complaints['hostel'];
                          final floor = complaints['floor'];
                          final date = complaints['date'];
                          final cleaningtype = complaints['cleaningtype'];
                          final block = complaints['block'];

                          controller.airConditionerServitorList.add(
                              AcServiterComplaintModel(
                                  username,
                                  mobile,
                                  hostel,
                                  block,
                                  floor,
                                  roomnumber,
                                  cleaningtype,
                                  date,
                                  timing,
                                  sender));
                        }
                        return indee == 0
                            ? Center(
                                child: Image.network(
                                    'https://www.levelaccess.com/wp-content/uploads/2019/02/docRemediation.png'))
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: indee,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 80, horizontal: 10),
                                    child: Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.black, width: 4),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                'https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            controller
                                                .airConditionerServitorList[
                                                    index]
                                                .sender,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Room No.: ',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueAccent,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      controller
                                                          .airConditionerServitorList[
                                                              index]
                                                          .room,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueAccent,
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Preferred Date: ',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueAccent,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      controller
                                                          .airConditionerServitorList[
                                                              index]
                                                          .date,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueAccent,
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Preffered Timing: ',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueAccent,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      controller
                                                          .airConditionerServitorList[
                                                              index]
                                                          .time,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueAccent,
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Remarks: ',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueAccent,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      controller
                                                          .airConditionerServitorList[
                                                              index]
                                                          .cleaningtype,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueAccent,
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 90,
                                                      height: 40,
                                                      decoration: const BoxDecoration(
                                                          color:
                                                              Colors.redAccent,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: TextButton(
                                                          onPressed: () async {
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
                                                                .airConditionerServitorList
                                                                .clear();
                                                          },
                                                          child: const Text(
                                                            'Solve',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20),
                                                          )),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width: 90,
                                                      height: 40,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            controller
                                                                    .touchAirConditionerServitor =
                                                                index;
                                                            DisplayAirConditionerServices
                                                                .launch();
                                                          },
                                                          child: const Text(
                                                            'Details',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20),
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
                );
              }),
        ],
      ),
    ));
  }
}
