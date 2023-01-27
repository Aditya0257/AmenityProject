import 'package:amenityfinal/app/modules/Serviter/LoginAndSignup/controller/servitorLoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../../../../widgets/circularprofile.dart';
import '../../GeneralServiter/generalServiterPage.dart';
import '../../MedicalServiter/medicalServitorPage.dart';
import '../../TransportServiter/transportServiterPage.dart';


class DrawerServiter extends GetView<ServiterLoginController> {
  static const route = '/servitor-drawer';

  DrawerServiter({super.key});

  static launch() => Get.toNamed(route);

  var pages = const [GeneralServiter(), TransportServiter(), MedicalServiter()];
  // int y = 0;
  @override
  Widget build(BuildContext context) {
    print(controller.y.toString() + '_____________');

    return ZoomDrawer(
      menuScreen: const ServiterDrawerMenu(),
      mainScreen: pages[controller.y],
      mainScreenTapClose: true,
      androidCloseOnBackTap: true,
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      drawerShadowsBackgroundColor: Colors.white,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}

//menu of zoomdrawer
class ServiterDrawerMenu extends StatelessWidget {
  const ServiterDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ServiterLoginController());

    Get.find<ServiterLoginController>().getcurrentuser();
    print(Get.find<ServiterLoginController>()
                        .drawerUsername);

    // controller.getcurrentuser();
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            circular_profile(
                width: double.infinity,
                height: 150,
                Padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                link:
                    'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/177985490/original/7fae26891a298569d94bb883bb9a963e58b37d2e/make-a-minimalistic-avatar-based-on-your-photo.jpg',
                radius: 1),
            Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.fromLTRB(40, 0, 10, 15),
              child: GetBuilder<ServiterLoginController>(
                builder: (_) {
                  return Text(
                    Get.find<ServiterLoginController>()
                        .drawerUsername
                        .substring(
                            0,
                            Get.find<ServiterLoginController>()
                                .drawerUsername
                                .indexOf('@')),
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
            Container(
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
            Container(
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
            Container(
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
            Container(
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
            Container(
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
