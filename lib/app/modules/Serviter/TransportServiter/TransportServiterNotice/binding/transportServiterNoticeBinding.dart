import 'package:get/get.dart';

import '../controller/transportServiterNoticeController.dart';

class TransportServiterNoticeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransportServiterNoticeController());
  }
}
