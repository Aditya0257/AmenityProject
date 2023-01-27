import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/Refactor_text.dart';

import '../LoginAsOption/view/loginAsOption.dart';


class SplashScreen extends StatelessWidget {
  static const route = '/splash-screen';
  static launch()=>Get.toNamed(route);
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 90,),
            text_widget(text: 'A', size: 40, colour: Colors.blue, weight: FontWeight.normal, spacing: 0),
            const SizedBox(width: 2,),
            AnimatedTextKit(totalRepeatCount: 2,pause: const Duration(milliseconds: 500),animatedTexts: [
              RotateAnimatedText('MENITY',textStyle: const TextStyle(color: Colors.white,fontSize: 36)),
              RotateAnimatedText(' SYSTEM TO',textStyle: const TextStyle(color: Colors.white,fontSize: 36)),
              RotateAnimatedText('SSIST OTHERS',textStyle: const TextStyle(color: Colors.white,fontSize: 36)),

            ] )
          ],
        ),
        duration: 7200,
        backgroundColor: Colors.black54,
        nextScreen: const LoginAsOption());
  }
}