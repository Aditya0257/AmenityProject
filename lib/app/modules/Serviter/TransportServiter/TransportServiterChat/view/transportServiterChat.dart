import 'package:amenityfinal/app/models/transportChatServiterComplaint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../utils/colors.dart';
import '../controller/transportServiterChatController.dart';
import 'displayTransportServiterChatComplaints.dart';

class TransportServiterChat extends GetView<TransportServiterChatController> {
  static const route = '/transportServiter-chat';
  static launch() => Get.toNamed(route);
  const TransportServiterChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Complaints',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
              letterSpacing: 2),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
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
        GetBuilder<TransportServiterChatController>(
            init: TransportServiterChatController(),
            builder: (controller) {
              return SizedBox(
                width: double.maxFinite,
                height: 300,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('transport_complaint')
                        .snapshots(),
                    builder: (context, snap) {
                      controller.chatTransportList.clear();
                      if (!snap.hasData) {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: LoadingAnimationWidget.fourRotatingDots(
                              color: AppColors.white, size: 80),
                        );
                      }
                      int indee = 0;
                      List complaintss = snap.data!.docs;
                      for (var complaints in complaintss) {
                        indee++;
                        final sender = complaints['sender'];
                        final complaintname = complaints['name'];
                        final complaintnumber = complaints['number'];
                        final complaintproblem = complaints['problem'];
                        final complaintvehicle = complaints['vehicle'];
                        controller.chatTransportList.add(
                            TransportChatServiterComplaintModel(
                                complaintname,
                                complaintnumber,
                                complaintproblem,
                                complaintvehicle,
                                sender));
                      }
                      return ListView.builder(
                          itemCount: indee,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: double.maxFinite,
                              height: 130,
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Problem:  ',
                                          style: TextStyle(
                                              color: Colors.blueAccent),
                                        ),
                                        Text(controller
                                            .chatTransportList[index].prblm)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            const CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  'https://image.shutterstock.com/image-vector/contact-circle-neon-style-icon-260nw-1607646820.jpg'),
                                            ),
                                            const SizedBox(
                                              width: 9,
                                            ),
                                            Text(
                                              controller
                                                  .chatTransportList[index]
                                                  .sends
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 90,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                  color: Colors.blueAccent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: TextButton(
                                                  onPressed: () async {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .runTransaction((Transaction
                                                            myTransaction) async {
                                                      myTransaction.delete(snap
                                                          .data!
                                                          .docs[index]
                                                          .reference);
                                                    });
                                                    controller.chatTransportList
                                                        .clear();
                                                  },
                                                  child: const Text(
                                                    'Solve',
                                                    style: TextStyle(
                                                        color: Colors.white,
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
                                                  color: Colors.blueAccent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: TextButton(
                                                  onPressed: () {
                                                    controller.touchTransport =
                                                        index;
                                                    DisplayTransporServiterChatComplaints
                                                        .launch();
                                                  },
                                                  child: const Text(
                                                    'Details',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              );
            }),
      ],
    );
  }
}
