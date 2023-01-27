import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/loading.dart';
import '../../DrawerComplainant/view/drawerComplainant.dart';
import '../controller/complainantSignupController.dart';

class ComplainantSignupPage extends GetView<ComplainantSignupController> {
  static const route = '/complainant-signup';
  static launch() => Get.toNamed(route);

  const ComplainantSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                    width: double.maxFinite,
                    height: 30,
                    child: Center(
                        child: Text(
                      'Create new account',
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
                  width: 340,
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
                          labelText: 'Create your new Username',
                          labelStyle:
                              TextStyle(color: Colors.grey, letterSpacing: .9)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 340,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white24),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: TextFormField(
                      onChanged: (value) {
                        controller.phone = value as int;
                      },
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
                  width: 340,
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
                Hero(
                  tag: 'log',
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.blueAccent[700]),
                    child: TextButton(
                        onPressed: () async {
                          LoadingUtils.showLoader();
                          try {
                            final newuser = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email:
                                        controller.username + controller.back,
                                    password: controller.password);
                            if (newuser != null) {
                              DrawerComplainant.launch();
                            }
                          } catch (e) {
                            LoadingUtils.hideLoader();
                            //print(e);
                          }
                        },
                        child: Center(
                            child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
