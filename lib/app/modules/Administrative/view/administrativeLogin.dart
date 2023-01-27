import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/administrativeLoginController.dart';
import 'administrativeMainPage.dart';

class AdministrativeLoginPage
    extends GetView<AdministrativeLoginPageController> {
  static const route = '/Administrative-login';
  static launch() => Get.toNamed(route);
  const AdministrativeLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  decoration: InputDecoration(
                      labelText: 'Enter your username',
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
                      labelText: 'Enter your Password',
                      labelStyle:
                          TextStyle(color: Colors.grey, letterSpacing: .9)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blueAccent[700]),
              child: TextButton(
                  onPressed: () {
                    AdministrativeMainPage.launch();
                    // controller.onLogin();
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
    );
  }
}
