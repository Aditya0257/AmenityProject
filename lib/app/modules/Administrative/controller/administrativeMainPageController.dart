import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../helper/loading.dart';
import '../../../../helper/snackbar.dart';

class AdministrativeMainPageController extends GetxController {
  // String dropdownvalue = 'Select which service you provide';
  final items = [
    'Select which service you provide',
    'General (Air Conditioner, Cleaning, Wifi)',
    'Transportation',
    'Medical'
  ];
  late int phone;
  String username = '';
  late String password;
  bool showspinner = false;
  String a = '';
  late String name;

  final x = 'Select which service you provide'.obs;
  String get dropdownvalueObservable => x.value;

  dropDownValueUpdate(value) {
    x(value);
  }

  servicesDropdown() {
    if (dropdownvalueObservable ==
        'General (Air Conditioner, Cleaning, Wifi)') {
      a = '${username}_general';
      name = a;
    } else if (dropdownvalueObservable == 'Transportation') {
      a = '${username}_transport';
      name = a;
    } else if (dropdownvalueObservable == 'Medical') {
      a = '${username}_medical';
      name = a;
    } else {
      username = '';
      name = a;
    }
  }

  onCreateAccount() async {
    if (dropdownvalueObservable == 'Select which service you provide') {
      snackbar(
          'You have to select a service from the dropdown to proceed furthur.');
  
      name = username;
    } else {
      LoadingUtils.showLoader();
      try {
        final newuser = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: '${name}@servitor.com', password: password);
        if (newuser != null) {
          //print('Created successfully');
          LoadingUtils.hideLoader();
          snackbar('Account Created Successfully');
          
        }
      } catch (err) {
        //print(err);
        LoadingUtils.hideLoader();
        snackbar(err.toString());
        name = username;
      }
 
    }
  }
}
