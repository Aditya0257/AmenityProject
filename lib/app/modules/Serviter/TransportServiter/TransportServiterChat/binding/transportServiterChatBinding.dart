import 'package:get/get.dart';

import '../controller/transportServiterChatController.dart';

class TransportServiterChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransportServiterChatController());
  }
}
