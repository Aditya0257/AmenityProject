import 'package:get/get.dart';

import '../controller/servitorLoginController.dart';

class ServitorLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiterLoginController());
  }
}
