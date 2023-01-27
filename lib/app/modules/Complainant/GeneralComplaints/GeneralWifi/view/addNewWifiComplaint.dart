import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralWifi/controller/generalWifiController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewWifiComplaint extends GetView<GeneralWifiController> {
  static const route = '/addNew-wifiComplaint';
  static launch() => Get.toNamed(route);

  const AddNewWifiComplaint({super.key});
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
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: Icon(
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
                          children: [
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
                  SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(
                        child: Text(
                      'Fill out the form below to file a complaint.',
                      style: TextStyle(color: Colors.black, fontSize: 20),
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
                          labelText: 'Username',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black)),
                        width: 200,
                        height: 50,
                        child: Center(
                          child: Obx(() => DropdownButton(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                elevation: 9,
                                underline: Container(
                                  height: 0,
                                  width: 0,
                                ),
                                value: controller.dropdownvalue,
                                icon: Icon(Icons.keyboard_arrow_down),
                                items: controller.items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  // setState(() {
                                  //   dropdownvalue = newValue!;
                                  // });
                                  controller.dropDownValueUpdate(newValue);
                                },
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: TextFormField(
                          controller: controller.block,
                          decoration: InputDecoration(
                              labelText: 'Block/Building Name',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: TextFormField(
                          controller: controller.floornumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Floor Number',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: TextFormField(
                          controller: controller.roomnumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Room Number',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: controller.date,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          labelText: 'Preferred Date',
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
                      controller: controller.timing,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          labelText: 'Preferred Timing',
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
                      controller: controller.cleaningtype,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Remarks',
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
                              .collection('wifi_complaint')
                              .doc(Timestamp.now().toString())
                              .set({
                            'username': controller.username.text,
                            'sender': controller.loggedWifi.email.toString(),
                            'mobile': controller.mobile.text,
                            'hostel': controller.dropdownvalue,
                            'block': controller.block.text,
                            'floor': controller.floornumber.text,
                            'roomnumber': controller.roomnumber.text,
                            'cleaningtype': controller.cleaningtype.text,
                            'date': controller.date.text,
                            'timing': controller.timing.text
                          });
                          controller.wifiComplaintsList.clear();
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
