import 'package:get/get.dart';

import '../../GeneralComplaints/generalComplaintsPage.dart';
import '../../MedicalSection/medicalSectionPage.dart';
import '../../TransportationSection/transportationSectionPage.dart';

class MainBackgroundController extends GetxController{
  
  int inde = 0;
  var pages = [
    const GeneralComplaintsPage(),
    const TransportSectionPage(),
    const MedicalSectionPage()
  ];

  onTapBottomNavigationButtonUpdate(index) {
    inde = index;
    update();
  }

}