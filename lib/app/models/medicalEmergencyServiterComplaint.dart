class MedicalEmergencyServiterComplaintModel{
  late String username;
  late String mobile;
  late String type;
  late String hospital;
  late String vehicle;
  MedicalEmergencyServiterComplaintModel(String name, String phone, String service, String hospi, String vehicl){
    username=name;
    mobile=phone;
    type=service;
    hospital=hospi;
    vehicle=vehicl;
  }
}