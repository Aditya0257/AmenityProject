import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/transportServiterBookController.dart';

class DriverServicesBooking extends GetView<TransportServiterBookingsController> {
  static const route = '/driver-servicesBooking';
  static launch() => Get.toNamed(route);
  const DriverServicesBooking({Key? key}) : super(key: key);

  

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
                      'https://st.depositphotos.com/1052474/54676/v/600/depositphotos_546768550-stock-illustration-abstract-background-in-paper-cut.jpg'),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.blueAccent,
                                size: 30,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(
                        child: Text(
                          'Add new Transport service.',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        )),
                  ),
                  SizedBox(
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
                      decoration: InputDecoration(
                          labelText: 'Name of Driver',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: controller.mobile,
                      decoration: InputDecoration(
                          labelText: 'Email/Mobile Number',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: controller.fare,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Fare charges/km',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: controller.vechicle,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Vehicle',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: controller.vehicleNumber,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Vehicle number',
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.orangeAccent),
                      child: TextButton(
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('Transport_service')
                              .doc(Timestamp.now().toString())
                              .set({
                            'username': controller.username.text,
                            'mobile': controller.mobile.text,
                            'fare': controller.fare.text,
                            'vehicle': controller.vechicle.text,
                            'vehicle_number': controller.vehicleNumber.text,
                          });
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
