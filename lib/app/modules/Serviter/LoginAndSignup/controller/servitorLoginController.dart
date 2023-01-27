import 'package:amenityfinal/app/modules/Serviter/DrawerServiter/view/drawerServiter.dart';
import 'package:amenityfinal/helper/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ServiterLoginController extends GetxController {
  int y = 0;
  final _auth = FirebaseAuth.instance;

  String username = '';
  // var dropdownvalue = 'Select which service you provide';
  final items = [
    'Select which service you provide',
    'General (Air Conditioner, Cleaning, Wifi)',
    'Transportation',
    'Medical'
  ];
  String name = '';
  String password = '';
  String a = '';

  late String drawerUsername;

  bool showspinner = false;

  // String dropdownvalue = 'Select which service you provide';

  // dropdownvalueUpdate(value) {
  //   dropdownvalue = value;
  //   update();
  // }

 final x = 'Select which service you provide'.obs;
  String get dropdownvalueObservable => x.value;
  
  dropDownValueUpdate(value) {
    x(value);
  }

  servicesDropdown() {
    if (dropdownvalueObservable == 'General (Air Conditioner, Cleaning, Wifi)') {
      a = '${username}_general';
      name = a;
      y = 0;
    } else if (dropdownvalueObservable == 'Transportation') {
      a = '$username}_transport';
      name = a;
      y = 1;
    } else if (dropdownvalueObservable == 'Medical') {
      a = '$username}_medical';
      name = a;
      y = 2;
    }
    
  }

 

  onSignin() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: '$name@servitor.com', password: password);
      if (user != null) {
        DrawerServiter.launch();
      }
    } catch (err) {
      // name = username;
      //print('${err.toString()} <= ______error');
      snackbar(err.toString());
    }
  }


  //* drawerServitorController 

  late User loggeduser;

  @override
  void onInit() {
    getcurrentuser();
    super.onInit();
  }

  void getcurrentuser() async {
    try {
      final user = _auth.currentUser;
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
}
