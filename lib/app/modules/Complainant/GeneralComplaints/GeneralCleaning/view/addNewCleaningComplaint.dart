import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralCleaning/controller/generalCleaningController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewCleaningComplaint extends GetView<GeneralCleaningController> {
  static const route = '/addNew-cleaningComplaint';

  const AddNewCleaningComplaint({super.key});
  static launch() => Get.toNamed(route);

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
                                Navigator.of(context).pop();
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
                      controller: controller.mobile,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black)),
                        width: 200,
                        height: 50,
                        child: Center(
                          child: Obx(() => DropdownButton(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                elevation: 9,
                                underline: const SizedBox(
                                  height: 0,
                                  width: 0,
                                ),
                                value: controller.dropdownvalue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: controller.items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  controller.dropDownValueUpdate(newValue);
                                },
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: TextFormField(
                          controller: controller.block,
                          decoration: const InputDecoration(
                              labelText: 'Block/Building Name',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                          decoration: const InputDecoration(
                              labelText: 'Floor Number',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: TextFormField(
                          controller: controller.roomnumber,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Room Number',
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextFormField(
                      controller: controller.cleaningtype,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText:
                              'Cleaning Type(Sweeping, Mopping, Fan Cleaning , Dusting)',
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
                      controller: controller.date,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          labelText: 'Preferred Date',
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
                      controller: controller.timing,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          labelText: 'Preferred Timing',
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
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('cleaning_complaint')
                              .doc(Timestamp.now().toString())
                              .set({
                            'username': controller.username.text,
                            'sender': controller.loggedClean.email.toString(),
                            'mobile': controller.mobile.text,
                            'hostel': controller.dropdownvalue,
                            'block': controller.block.text,
                            'floor': controller.floornumber.text,
                            'roomnumber': controller.roomnumber.text,
                            'cleaningtype': controller.cleaningtype.text,
                            'date': controller.date.text,
                            'timing': controller.timing.text
                          });
                          controller.cleaningComplaintsList.clear();
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
