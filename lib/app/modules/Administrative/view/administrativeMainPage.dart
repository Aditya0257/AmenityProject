// ignore_for_file: prefer_const_constructors
import 'package:amenityfinal/app/modules/LoginAsOption/view/loginAsOption.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dimensions.dart';
import '../controller/administrativeMainPageController.dart';

class AdministrativeMainPage extends GetView<AdministrativeMainPageController> {
  static const route = '/Administrative-mainPage';

  const AdministrativeMainPage({super.key});
  static launch() => Get.toNamed(route);

  @override
  Widget build(BuildContext context) {
    controller.servicesDropdown();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width40),
                  child: SizedBox(
                    height: 80,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                            onTap: () {
                              // Get.back();
                              Get.offAll(LoginAsOption());
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 35,
                            ))),
                  ),
                ),
                SizedBox(
                    width: double.maxFinite,
                    height: 30,
                    child: Center(
                        child: Text(
                      'Create a new servitor',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                          color: Colors.white),
                    ))),
                SizedBox(
                    width: double.maxFinite,
                    height: 70,
                    child: Center(
                        child: Text(
                      'Please fill in the form to continue',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          letterSpacing: .9,
                          color: Colors.grey),
                    ))),
                SizedBox(
                  height: 70,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Dimensions.screenWidth * 0.82,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white24),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: TextFormField(
                      onChanged: (value) {
                        controller.username = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Create new Servitor username',
                          labelStyle:
                              TextStyle(color: Colors.grey, letterSpacing: .9)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Dimensions.screenWidth * 0.82,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white24),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                    child: Obx(() => DropdownButton(
                          dropdownColor: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          elevation: 9,
                          underline: SizedBox(
                            height: 0,
                            width: 0,
                          ),
                          value: controller.dropdownvalueObservable,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: controller.items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // setState(() {
                            //   dropdownvalue = newValue!;
                            // });
                            controller.dropDownValueUpdate(newValue);
                            controller.servicesDropdown();
                          },
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Dimensions.screenWidth * 0.82,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white24),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle:
                              TextStyle(color: Colors.grey, letterSpacing: .9)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Dimensions.screenWidth * 0.82,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white24),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: TextFormField(
                      onChanged: (value) {
                        controller.password = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(color: Colors.grey, letterSpacing: .9)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blueAccent[700]),
                  child: TextButton(
                      onPressed: () {
                        controller.onCreateAccount();
                      },
                      child: Center(
                          child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
