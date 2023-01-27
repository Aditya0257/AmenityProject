import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../../helper/loading.dart';
import '../../../../../helper/shared_preference.dart';
import '../../../../../helper/snackbar.dart';
import '../../DrawerComplainant/view/drawerComplainant.dart';

class ComplainantLoginController extends GetxController {
  String username = '';
  String password = '';

  final prefs = SPController();

  late User loggeduser;

  late String drawerUsername;

  void getcurrentuser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggeduser = user;
        final mail = loggeduser.email;
        drawerUsername = mail!;
        update();
        //print(loggeduser.email);
      }
    } catch (err) {
      //print(err);
    }
  }

  onSignin() async {
    LoadingUtils.showLoader();
    try {
      print(username);
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: '${username}@complainant.com', password: password)
          .then((value) {
        var uid = value.user!.uid;
        print(uid);
        prefs.setIsLoggedin(true);
        prefs.setUserId(uid);
        LoadingUtils.hideLoader();
      });
      print(user);
      if (user == null) {
        DrawerComplainant.launch();
      } else {
        snackbar('This user account doesn\'t exist, kindly Signup.');
      }
    } catch (e) {
      LoadingUtils.hideLoader();
      // print(e);
      snackbar(e.toString());
    }
  }
}
