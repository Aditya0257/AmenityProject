import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/mainBackgroundController.dart';

class MainBackground extends GetView<MainBackgroundController> {
  const MainBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
      ),
      SafeArea(
        child: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              animationDuration: const Duration(milliseconds: 300),
              height: 50,
              backgroundColor: Colors.white,
              color: Colors.black,
              index: 0,
              items: const [
                Icon(
                  Icons.cleaning_services_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.emoji_transportation,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.medication,
                  size: 30,
                  color: Colors.white,
                )
              ],
              onTap: (index) {
                // setState(() {
                //   inde = index;
                // });
                controller.onTapBottomNavigationButtonUpdate(index);
              },
            ),
            backgroundColor: Colors.transparent,
            body: GetBuilder<MainBackgroundController>(builder: (_) {
              return controller.pages[controller.inde];
            })),
      ),
    ]);
  }
}
