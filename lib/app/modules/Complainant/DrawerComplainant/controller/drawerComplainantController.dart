import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DrawerComplainantController extends GetxController{


late User loggeduser;

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  void getCurrentUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggeduser = user;
      }
    } catch (e) {
      //print(e);
    }
  }
}