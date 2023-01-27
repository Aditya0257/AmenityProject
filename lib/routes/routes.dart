import 'package:amenityfinal/app/modules/Administrative/binding/administrativeBinding.dart';
import 'package:amenityfinal/app/modules/Complainant/MedicalSection/MedicalEmergency/binding/medicalEmergencyBinding.dart';
import 'package:amenityfinal/app/modules/Complainant/MedicalSection/MedicalEmergency/view/medicalEmergency.dart';
import 'package:amenityfinal/app/modules/Complainant/MedicalSection/MedicalQueries/binding/medicalQueriesBinding.dart';
import 'package:amenityfinal/app/modules/Complainant/MedicalSection/MedicalQueries/view/medicalQueries.dart';
import 'package:amenityfinal/app/modules/Serviter/LoginAndSignup/view/servitorLogin.dart';
import 'package:amenityfinal/app/modules/Serviter/TransportServiter/TransportServiterNotice/view/transportServiterNotice.dart';
import 'package:get/get.dart';

import '../app/modules/Administrative/view/administrativeLogin.dart';
import '../app/modules/Administrative/view/administrativeMainPage.dart';
import '../app/modules/Complainant/DrawerComplainant/binding/drawerComplainantBinding.dart';
import '../app/modules/Complainant/GeneralComplaints/GeneralAC/binding/generalAcBinding.dart';
import '../app/modules/Complainant/GeneralComplaints/GeneralAC/view/addNewAcComplaint.dart';
import '../app/modules/Complainant/GeneralComplaints/GeneralAC/view/generalAc.dart';
import '../app/modules/Complainant/GeneralComplaints/GeneralCleaning/binding/generalCleaningBinding.dart';
import '../app/modules/Complainant/GeneralComplaints/GeneralCleaning/view/addNewCleaningComplaint.dart';
import '../app/modules/Complainant/GeneralComplaints/GeneralCleaning/view/generalCleaning.dart';
import '../app/modules/Complainant/GeneralComplaints/GeneralWifi/binding/generalWifiBinding.dart';
import '../app/modules/Complainant/GeneralComplaints/GeneralWifi/view/addNewWifiComplaint.dart';
import '../app/modules/Complainant/GeneralComplaints/GeneralWifi/view/generalWifi.dart';
import '../app/modules/Complainant/LoginAndSignup/binding/complainantLoginBinding.dart';
import '../app/modules/Complainant/LoginAndSignup/view/complainantSignup.dart';
import '../app/modules/Complainant/DrawerComplainant/view/drawerComplainant.dart';
import '../app/modules/Complainant/LoginAndSignup/view/complainantLogin.dart';
import '../app/modules/Complainant/TransportationSection/TransportationBooking/view/transportationBooking.dart';
import '../app/modules/Complainant/TransportationSection/TransportationComplaint/binding/transportationComplaintBinding.dart';
import '../app/modules/Complainant/TransportationSection/TransportationComplaint/view/addNewTransportationComplaint.dart';
import '../app/modules/Complainant/TransportationSection/TransportationComplaint/view/transportationComplaint.dart';
import '../app/modules/Complainant/TransportationSection/TransportationNotice/view/transportationNotice.dart';
import '../app/modules/LoginAsOption/binding/loginAsOptionBinding.dart';
import '../app/modules/LoginAsOption/view/loginAsOption.dart';
import '../app/modules/Serviter/DrawerServiter/view/drawerServiter.dart';
import '../app/modules/Serviter/GeneralServiter/generalServiterPage.dart';
import '../app/modules/Serviter/LoginAndSignup/binding/servitorLoginBinding.dart';
import '../app/modules/Serviter/TransportServiter/TransportServiterBook/binding/transportServiterBookBinding.dart';
import '../app/modules/Serviter/TransportServiter/TransportServiterBook/view/driverServicesBooking.dart';
import '../app/modules/Serviter/TransportServiter/TransportServiterBook/view/transportServiterBook.dart';
import '../app/modules/Serviter/TransportServiter/TransportServiterChat/binding/transportServiterChatBinding.dart';
import '../app/modules/Serviter/TransportServiter/TransportServiterChat/view/transportServiterChat.dart';
import '../app/modules/Serviter/TransportServiter/TransportServiterNotice/binding/transportServiterNoticeBinding.dart';
import '../app/modules/Serviter/TransportServiter/TransportServiterNotice/view/addNewTransportServiterNotice.dart';
import '../app/modules/Serviter/TransportServiter/TransportServiterNotice/view/displayTransportServiterNotice.dart';
import '../app/modules/SplashScreen/splashScreen.dart';

//? route navigation without getx state management...
// Map<String, Widget Function(BuildContext)> appRoutes() {
//   return {
//     AddNewAirConditionerComplaint.route: (context) =>
//         const AddNewAirConditionerComplaint(),
//     AddNewCleaningComplaint.route: (context) => AddNewCleaningComplaint(),
//     CleaningComplaints.route: (context) => const CleaningComplaints(),
//     ComplainantLoginPage.route: (context) => const ComplainantLoginPage(),
//     SignupPage.route: (context) => const SignupPage(),
//     DrawerComplainant.route: (context) => const DrawerComplainant(),
//     DrawerServitor.route: (context) => const DrawerServitor(),
//     GeneralServitor.route: (context) => const GeneralServitor(),
//     TransportationNotice.route: (context) => const TransportationNotice(),
//     SplashScreen.route: (context) => const SplashScreen(),
//   };
// }

//? route navigation with getx state management...
class AppRoutes {
  static final pages = [
    GetPage(
      name: LoginAsOption.route,
      page: () => const LoginAsOption(),
      binding: LoginAsOptionBinding(),
    ),
    
    GetPage(
      name: AirConditionerComplaints.route,
      page: () => const AirConditionerComplaints(),
      binding: GeneralAirConditionerBinding(),
    ),
    GetPage(
      name: AddNewAirConditionerComplaint.route,
      page: () => const AddNewAirConditionerComplaint(),
      // binding: GeneralAirConditionerBinding(),
      
    ),
    GetPage(
      name: AddNewCleaningComplaint.route,
      page: () =>  AddNewCleaningComplaint(), 
      binding: GeneralCleaningBinding(),
    ),
    GetPage(
      name: CleaningComplaints.route,
      page: () =>  CleaningComplaints(),
      binding: GeneralCleaningBinding(),
    ),
    GetPage(
      name: AddNewWifiComplaint.route,
      page: () =>  const AddNewWifiComplaint(), 
      //binding: GeneralWifiBinding(),
    ),
    GetPage(
      name: WifiComplaints.route,
      page: () => const WifiComplaints(),
      binding: GeneralWifiBinding(),
    ),
    GetPage(
      name: ComplainantSignupPage.route,
      page: () => const ComplainantSignupPage(),
      binding: ComplainantLoginBinding(), 
    ),
    GetPage(
      name: ComplainantLoginPage.route,
      page: () => const ComplainantLoginPage(),
      binding: ComplainantLoginBinding(),
    ),
    GetPage(
      name: ServitorLoginPage.route,
      page: () => const ServitorLoginPage(),
      binding: ServitorLoginBinding(),
    ),
    GetPage(name: AdministrativeLoginPage.route,
    page: () => const AdministrativeLoginPage(),
    binding: AdministrativeBinding(),
    ),
    GetPage(name: AdministrativeMainPage.route,
    page: () =>  AdministrativeMainPage(),
    binding: AdministrativeBinding(),
    ),
   
    GetPage(
      name: DrawerComplainant.route,
      page: () => const DrawerComplainant(),
      binding: DrawerComplainantBinding(),
    ),
    GetPage(
      name: DrawerServiter.route,
      page: () => DrawerServiter(),
    ),
    GetPage(
      name: GeneralServiter.route,
      page: () => const GeneralServiter(),
    ),
    GetPage(
      name: TransportationNotice.route,
      page: () => const TransportationNotice(),
    ),
    GetPage(
      name: TransportationComplaint.route,
      page: () => const TransportationComplaint(),
    ),
    GetPage(
      name: TransportationBooking.route,
      page: () => const TransportationBooking(),
    ),
    GetPage(
      name: SplashScreen.route,
      page: () => const LoginAsOption(),
      
    ),
    GetPage(
      name: MedicalEmergency.route,
      page: () => const MedicalEmergency(),
      binding: MedicalEmergencyBinding(),
    ),
    GetPage(
      name: MedicalQueries.route,
      page: () => const MedicalQueries(),
      binding: MedicalQueriesBinding(),
    ),
    GetPage(
      name: TransportServiterBookings.route,
      page: () => const TransportServiterBookings(),
      binding: TransportServiterBookingsBinding(),
    ),
    GetPage(
      name: DriverServicesBooking.route,
      page: () => const DriverServicesBooking(),
      binding: TransportServiterBookingsBinding(),
    ),
    GetPage(
      name: TransportServiterChat.route,
      page: () => const TransportServiterChat(),
      binding: TransportServiterChatBinding(),
    ),
     GetPage(
      name: TransportServiterNotice.route,
      page: () => const TransportServiterNotice(),
      binding: TransportServiterNoticeBinding(),
    ),
    GetPage(
      name: AddNewTransportServiterNotice.route,
      page: () => const AddNewTransportServiterNotice(),
      binding: TransportServiterNoticeBinding(),
    ),
    GetPage(
      name: DisplayTransportServiterNotice.route,
      page: () => const DisplayTransportServiterNotice(),
      binding: TransportServiterNoticeBinding(),
    ),
    GetPage(
      name: AddNewTransportationComplaint.route,
      page: () => const AddNewTransportationComplaint(),
      binding: TransportationComplaintBinding(),
    ),
    
    

  ];
}
