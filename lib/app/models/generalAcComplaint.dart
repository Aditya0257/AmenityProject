class AirConditionerComplaintModel {
  late String username;
  late String phone;
  late String hostel;
  late String block;
  late String floor;
  late String room;
  late String cleaningtype;
  late String date;
  late String time;
  AirConditionerComplaintModel(
      String usernames,
      String phones,
      String hostels,
      String blocks,
      String floors,
      String rooms,
      String cleaningtypes,
      String dates,
      String times) {
    username = usernames;
    phone = phones;
    hostel = hostels;
    block = blocks;
    floor = floors;
    room = rooms;
    cleaningtype = cleaningtypes;
    date = dates;
    time = times;
  }
}