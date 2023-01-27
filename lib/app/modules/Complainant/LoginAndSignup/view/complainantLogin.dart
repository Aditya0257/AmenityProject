import 'package:amenityfinal/app/modules/Complainant/LoginAndSignup/view/complainantSignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/complainantLoginController.dart';

class ComplainantLoginPage extends GetView<ComplainantLoginController> {
  static const route = '/complainant-login';
  static launch() => Get.toNamed(route);

  const ComplainantLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
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
            const SizedBox(
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
              width: double.maxFinite,
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
                    onPressed: () {
                      controller.onSignin();
                    },
                    child: Center(
                        child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  TextButton(
                      onPressed: () {
                        ComplainantSignupPage.launch();
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerMenu extends GetView<ComplainantLoginController> {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getcurrentuser();
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/177985490/original/7fae26891a298569d94bb883bb9a963e58b37d2e/make-a-minimalistic-avatar-based-on-your-photo.jpg'),
                radius: 1,
              ),
            ),
            Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.fromLTRB(40, 0, 10, 15),
              child: GetBuilder<ComplainantLoginController>(
                builder: (_) {
                  return Text(
                    controller.drawerUsername,
                    style: TextStyle(
                        color: Colors.white, fontSize: 17, letterSpacing: 2),
                  );
                },
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.wallet,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Payment',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.question_mark_rounded,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Help',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'About Us',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.star_border,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Rate Us',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
