import 'package:amenityfinal/app/modules/SplashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import '../utils/theme.dart';
import 'modules/LoginAsOption/controller/loginAsOptionController.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(() => LoginAsOptionController());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amenity',
      theme: MyTheme.lightTheme(context),
      // routes: appRoutes(),
      getPages: AppRoutes.pages,
      initialRoute: SplashScreen.route,
    );
  }
}
