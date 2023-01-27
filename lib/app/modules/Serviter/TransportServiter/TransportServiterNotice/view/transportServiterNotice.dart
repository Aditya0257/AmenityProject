import 'package:amenityfinal/app/modules/Serviter/TransportServiter/TransportServiterNotice/view/addNewTransportServiterNotice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/transportNoticeDataServiter.dart';
import '../controller/transportServiterNoticeController.dart';
import 'displayTransportServiterNotice.dart';

class TransportServiterNotice
    extends GetView<TransportServiterNoticeController> {
  static const route = '/transportServiter-notice';
  static launch() => Get.toNamed(route);
  const TransportServiterNotice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Notice',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
              letterSpacing: 2),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          width: 300,
          height: 10,
          child: Divider(
            color: Colors.grey,
            thickness: 2,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            const Text(
              'Other Notices',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<TransportServiterNoticeController>(
                init: TransportServiterNoticeController(),
                builder: (controller) {
                  return SizedBox(
                      width: double.infinity,
                      height: 180,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('notice')
                            .snapshots(),
                        builder: (context, snapshot) {
                          controller.transportServiterNoticeList.clear();
                          int indee = 0;
                          if (snapshot.hasData) {
                            final notice = snapshot.data!.docs;
                            for (var message in notice) {
                              indee++;
                              final subjects = message['subject'];
                              final body = message['body'];
                              controller.transportServiterNoticeList.add(
                                  TransportNoticeDataServiterModel(
                                      subjects, body));
                            }
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: indee,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  width: 350,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    border: Border.all(
                                        color: Colors.blueAccent, width: 4),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://www.crushpixel.com/big-static18/preview4/avatar-profile-pink-neon-icon-2920285.jpg'),
                                      ),
                                      const SizedBox(
                                        height: 9,
                                      ),
                                      const Text(
                                        'user_1693',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 9,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Subject: ',
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                              width: 200,
                                              height: 20,
                                              child: Text(
                                                controller
                                                    .transportServiterNoticeList[
                                                        index]
                                                    .sub,
                                                maxLines: 1,
                                                overflow: TextOverflow.fade,
                                                softWrap: false,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                controller
                                                        .touchTransportServiter =
                                                    index;
                                                DisplayTransportServiterNotice
                                                    .launch();
                                              },
                                              child: Container(
                                                  width: 60,
                                                  height: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          color: Colors.green),
                                                  child: const Center(
                                                      child: Text(
                                                    'Details',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )))),
                                          TextButton(
                                              onPressed: () async {
                                                await FirebaseFirestore.instance
                                                    .runTransaction((Transaction
                                                        myTransaction) async {
                                                  await myTransaction.delete(
                                                      snapshot.data!.docs[index]
                                                          .reference);
                                                });
                                                controller
                                                    .transportServiterNoticeList
                                                    .removeAt(index);
                                              },
                                              child: Container(
                                                  width: 60,
                                                  height: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          color:
                                                              Colors.redAccent),
                                                  child: const Center(
                                                      child: Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )))),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ));
                }),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                AddNewTransportServiterNotice.launch();
              },
              child: SizedBox(
                width: double.maxFinite,
                height: 100,
                child: Card(
                  color: Colors.blueAccent,
                  elevation: 1,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    children: const [
                       SizedBox(
                        width: 100,
                      ),
                       Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.black,
                          ),
                       Text(
                        'Add New',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
