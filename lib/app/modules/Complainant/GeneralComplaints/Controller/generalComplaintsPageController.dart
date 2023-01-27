import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GeneralComplaintsPageController extends GetxController {
  String userid = '';
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

        userid = loggeduser.email as String;
      }
    } catch (err) {
      //print(err.toString());
    }
  }
}
