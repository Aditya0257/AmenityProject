import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/TextButton.dart';
import '../../../../widgets/background_image.dart';
import '../../Administrative/view/administrativeLogin.dart';
import '../../Complainant/LoginAndSignup/view/complainantLogin.dart';
import '../../Serviter/LoginAndSignup/view/servitorLogin.dart';
import '../controller/loginAsOptionController.dart';

class LoginAsOption extends GetView<LoginAsOptionController> {
  static const route = '/loginAs-option';
  static launch() => Get.toNamed(route);
  const LoginAsOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: background(
      link:
          'https://w0.peakpx.com/wallpaper/362/715/HD-wallpaper-color-amoled-minimal-plain-gradient-black-amoled-colors.jpg',
      child: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 7,
              fit: FlexFit.loose,
              child: Container(width: double.maxFinite),
            ),
            Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TypewriterAnimatedText('Welcome',
                            speed: Duration(milliseconds: 500)),
                      ],
                      onTap: () {},
                    ),
                  ),
                )),
            Flexible(
                flex: 9,
                fit: FlexFit.loose,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                          onPressed: () {
                            ServitorLoginPage.launch();
                          },
                          width: 300,
                          height: 80,
                          border: 20,
                          color: Colors.deepOrange,
                          child: const Center(
                            child: Text(
                              'Log In As Servitor',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Button(
                        onPressed: () {
                          ComplainantLoginPage.launch();
                        },
                        width: 300,
                        height: 80,
                        border: 20,
                        color: Colors.deepOrange,
                        child: const Center(
                          child: Text(
                            'Log In As Complainant',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Button(
                        onPressed: () {
                          AdministrativeLoginPage.launch();
                        },
                        width: 300,
                        height: 80,
                        border: 20,
                        color: Colors.deepOrange,
                        child: Center(
                            child: Text(
                          'Log In As Administrative',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        )),
                      )
                    ],
                  ),
                )),
            Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Container(
                  width: double.maxFinite,
                ))
          ],
        ),
      ),
    ));
  }
}
