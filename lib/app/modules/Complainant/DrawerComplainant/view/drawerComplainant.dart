import 'package:amenityfinal/app/modules/Complainant/DrawerComplainant/controller/drawerComplainantController.dart';
import 'package:amenityfinal/widgets/circularprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import '../../../../../utils/dimensions.dart';
import '../../LoginAndSignup/controller/complainantLoginController.dart';
import 'chattingSection.dart';
import 'mainBackground.dart';

class DrawerComplainant extends GetView<DrawerComplainantController> {
  static const route = '/complainant-drawer';
  static launch() => Get.toNamed(route);

  const DrawerComplainant({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: const ComplainantDrawerMenu(),
      mainScreen: const SnappedSheet(),
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
class ComplainantDrawerMenu extends StatelessWidget {
  const ComplainantDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ComplainantLoginController());

    Get.find<ComplainantLoginController>().getcurrentuser();
    print(Get.find<ComplainantLoginController>()
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
              child: GetBuilder<ComplainantLoginController>(
                builder: (_) {
                  return Text(
                    Get.find<ComplainantLoginController>()
                        .drawerUsername
                        .substring(
                            0,
                            Get.find<ComplainantLoginController>()
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

class SnappedSheet extends GetView<DrawerComplainantController> {
  const SnappedSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      child: MainBackground(),
      lockOverflowDrag: true,
      snappingPositions: [
        SnappingPosition.factor(
          grabbingContentOffset: GrabbingContentOffset.top,
          snappingCurve: Curves.easeInExpo,
          snappingDuration: const Duration(seconds: 1),
          positionFactor: MediaQuery.of(context).size.height *
              .75 /
              MediaQuery.of(context).size.height,
        ),
        const SnappingPosition.factor(
          positionFactor: 0.07,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: GrabbingContentOffset.bottom,
        ),
      ],
      grabbing: const GrabbingWidget(),
      grabbingHeight: Dimensions.height40 * 2.6,
      // MediaQuery.of(context).size.height * .095,
      sheetAbove: SnappingSheetContent(child: const ChattingSection()),
    );
  }
}

class GrabbingWidget extends StatelessWidget {
  const GrabbingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(60)),
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)]),
        child: const Padding(
          padding: EdgeInsets.fromLTRB(150, 50, 150, 20),
          child: Divider(
            thickness: 3,
            color: Colors.white,
          ),
        ));
  }
}
