import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../helper/loading.dart';
import '../../../../helper/snackbar.dart';
import '../view/administrativeMainPage.dart';

class AdministrativeLoginPageController extends GetxController {
  late String username;
  late String password;

  onLogin() async {
    LoadingUtils.showLoader();
    try {
      final _user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: '${username}@administrative.com', password: password);
      if (_user != null) {
        LoadingUtils.hideLoader();
        AdministrativeMainPage.launch();
      }
    } catch (err) {
      LoadingUtils.hideLoader();
      snackbar(err.toString());
      //print(err);
      // showAlertDialog(context);
    }
  }
}
