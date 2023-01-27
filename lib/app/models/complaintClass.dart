// ignore_for_file: file_names

class ComplaintClassModel {
  late String usrname;
  late String mobl;
  late String prblm;
  late String vhcle;

  ComplaintClassModel(
      String username, String mobile, String problem, String vehicle) {
    usrname = username;
    mobl = mobile;
    prblm = problem;
    vhcle = vehicle;
  }
}