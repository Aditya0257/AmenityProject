class MedicalQueriesComplaintModel {
  late String username;
  late String mobile;
  late String email;
  late String hospital;
  late String speciality;
  MedicalQueriesComplaintModel(
      String name, String phone, String service, String hospi, String vehicl) {
    username = name;
    mobile = phone;
    email = service;
    hospital = hospi;
    speciality = vehicl;
  }
}
