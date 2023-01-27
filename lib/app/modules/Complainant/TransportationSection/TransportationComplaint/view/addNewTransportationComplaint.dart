import 'package:amenityfinal/app/modules/Complainant/TransportationSection/TransportationComplaint/controller/transportationComplaintController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewTransportationComplaint
    extends GetView<TransportationComplaintController> {
  static const route = '/addNew-transportationComplaint';
  static launch() => Get.toNamed(route);
  const AddNewTransportationComplaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/f4/c7/c7/f4c7c774933d1cf1487e59296b2351c1--a-r-iphone-wallpaper.jpg'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Image(
                                image: NetworkImage(
                                    'https://st2.depositphotos.com/3765753/5349/v/600/depositphotos_53491365-stock-illustration-complaint-red-rubber-stamp-vector.jpg')),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(
                        child: Text(
                      'Fill out the form below to file a complaint.',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
                  ),
                  const SizedBox(
                    width: 300,
                    height: 70,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: controller.username,
                      decoration: const InputDecoration(
                          labelText: 'Username',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: controller.number,
                      decoration: const InputDecoration(
                          labelText: 'Email/Mobile Number',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: controller.vehicle,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: 'Vehicle Type(Bus, Cab, Bike)',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: TextFormField(
                          controller: controller.problem,
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          decoration: const InputDecoration(
                            labelText: 'Problem',
                            hintText: 'Briefly describe your problem here',
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.orangeAccent),
                      child: TextButton(
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        onPressed: () async {
                          FirebaseFirestore.instance
                              .collection('transport_complaint')
                              .doc(Timestamp.now().toString())
                              .set({
                            'name': controller.username.text,
                            'number': controller.number.text,
                            'problem': controller.problem.text,
                            'vehicle': controller.vehicle.text,
                            'sender': controller.loggedUser.email.toString()
                          });
                          controller.transportationComplaintList.clear();
                          Get.back();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
