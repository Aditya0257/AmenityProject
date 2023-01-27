import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/medicalServiterEmergencyController.dart';

class AmbulanceServices extends GetView<MedicalEmergencyServicesController> {
   static const route = '/ambulance-services';
  static launch() => Get.toNamed(route);
  const AmbulanceServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://w0.peakpx.com/wallpaper/242/720/HD-wallpaper-black-orange-abstract-black-modern-new-shadow-shape-waves-white-thumbnail.jpg'),
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
                                Navigator.of(context).pop();
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
                          'Add new emergency service.',
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
                      controller: controller.service,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Service Type',
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
                      controller: controller.hospital,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Hospital',
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
                              .collection('emergency')
                              .doc(Timestamp.now().toString())
                              .set({
                            'username': controller.username.text,
                            'mobile': controller.mobile.text,
                            'service': controller.service.text,
                            'hospital': controller.hospital.text,
                            'vehicle': controller.vehicleNumber.text,
                          });
                          Navigator.of(context).pop();
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
