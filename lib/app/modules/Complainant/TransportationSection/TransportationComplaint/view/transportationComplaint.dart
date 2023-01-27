import 'package:amenityfinal/app/models/complaintClass.dart';
import 'package:amenityfinal/app/modules/Complainant/TransportationSection/TransportationComplaint/controller/transportationComplaintController.dart';
import 'package:amenityfinal/app/modules/Complainant/TransportationSection/TransportationComplaint/view/addNewTransportationComplaint.dart';
import 'package:amenityfinal/app/modules/Complainant/TransportationSection/TransportationComplaint/view/displayTransportationComplaint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransportationComplaint
    extends GetView<TransportationComplaintController> {
  static const route = '/transportation-complaint';
  static launch() => Get.toNamed(route);
  const TransportationComplaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/000/095/572/non_2x/vector-dark-wallpaper-design.jpg'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
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
                                Navigator.of(context).pop();
                              }),
                        ],
                      ),
                      const Text(
                        'Complaint',
                        style: TextStyle(fontSize: 27, color: Colors.white),
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
              Expanded(
                  flex: 6,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 35),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.black54),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                          'Name of Complainant',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 10,
                child: Container(
                  margin: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white),
                  child: SingleChildScrollView(
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
                        Container(
                          height: 90,
                          width: 340,
                          decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextButton(
                            onPressed: () {
                              AddNewTransportationComplaint.launch();
                            },
                            child: const Center(
                                child: Text(
                              '+ Add New',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  letterSpacing: 1.8,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GetBuilder<TransportationComplaintController>(
                            init: TransportationComplaintController(),
                            builder: (controller) {
                              return SizedBox(
                                width: double.maxFinite,
                                height: 269,
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('transport_complaint')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    // Get.lazyPut(() =>
                                    //     TransportationComplaintController());
                                    int indee = 0;
                                    controller.transportationComplaintList
                                        .clear();
                                    if (snapshot.hasData) {
                                      final complaint = snapshot.data!.docs;
                                      for (var complaints in complaint) {
                                        final sender = complaints['sender'];
                                        if (sender.toString() ==
                                            controller.loggedUser.email
                                                .toString()) {
                                          indee++;
                                          final complaintname =
                                              complaints['name'];
                                          final complaintnumber =
                                              complaints['number'];
                                          final complaintproblem =
                                              complaints['problem'];
                                          final complaintvehicle =
                                              complaints['vehicle'];
                                          controller.transportationComplaintList
                                              .add(ComplaintClassModel(
                                                  complaintname,
                                                  complaintnumber,
                                                  complaintproblem,
                                                  complaintvehicle));
                                        }
                                      }
                                    }
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: indee,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            width: 350,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(30)),
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
                                                  controller.loggedUser.email
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                                const SizedBox(
                                                  height: 9,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      'Problem: ',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueAccent,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                        width: 200,
                                                        height: 20,
                                                        child: Text(
                                                          controller
                                                              .transportationComplaintList[
                                                                  index]
                                                              .prblm,
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow.fade,
                                                          softWrap: false,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                        ))
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {
                                                          controller.touch =
                                                              index;
                                                          DisplayTransportationComplaint
                                                              .launch();
                                                        },
                                                        child: Container(
                                                            width: 60,
                                                            height: 40,
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                                color: Colors
                                                                    .green),
                                                            child: const Center(
                                                                child: Text(
                                                              'Details',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )))),
                                                    TextButton(
                                                        onPressed: () async {
                                                          await FirebaseFirestore
                                                              .instance
                                                              .runTransaction(
                                                                  (Transaction
                                                                      myTransaction) async {
                                                            myTransaction
                                                                .delete(snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .reference);
                                                          });
                                                          controller
                                                              .transportationComplaintList
                                                              .clear();
                                                        },
                                                        child: Container(
                                                            width: 60,
                                                            height: 40,
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                                color: Colors
                                                                    .redAccent),
                                                            child: const Center(
                                                                child: Text(
                                                              'Delete',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
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
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
