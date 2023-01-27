// ignore_for_file: prefer_const_constructors

import 'package:amenityfinal/app/modules/Serviter/LoginAndSignup/controller/servitorLoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/dimensions.dart';
import '../../DrawerServiter/view/drawerServiter.dart';

class ServitorLoginPage extends GetView<ServiterLoginController> {
  static const route = '/servitor-login';

  const ServitorLoginPage({super.key});
  static launch() => Get.toNamed(route);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                  width: double.maxFinite,
                  height: 30,
                  child: Center(
                      child: Text(
                    'Welcome Back!',
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
                    'Please sign in to your account',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        letterSpacing: .9,
                        color: Colors.grey),
                  ))),
              SizedBox(
                height: 70,
              ),
              Container(
                width: Dimensions.screenWidth*0.82,
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
                    decoration: InputDecoration(
                        labelText: 'Enter your username',
                        labelStyle:
                            TextStyle(color: Colors.grey, letterSpacing: .9)),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height10*1.2,
              ),
              Container(
                width: Dimensions.screenWidth*0.82,
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
                          // controller.dropdownvalueUpdate(newValue);
                          controller.servicesDropdown();
                          //print(controller.y);
                        },
                      )),
                ),
              ),
              SizedBox(
                height: Dimensions.height10*1.2,
              ),
              Container(
                width: Dimensions.screenWidth*0.82,
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
                        labelText: 'Enter your Password',
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
                    onPressed: () async {
                      //controller.onSignin();
                      DrawerServiter.launch();
                    },
                    child: Center(
                        child: Text(
                      'Sign In',
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
    );
  }
}
