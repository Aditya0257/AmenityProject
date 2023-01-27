import 'package:amenityfinal/app/modules/Complainant/GeneralComplaints/GeneralCleaning/controller/generalCleaningController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayCleaningComplaints extends GetView<GeneralCleaningController> {
    static const route = '/displayCleaning-complaint';
  static launch() => Get.toNamed(route);
  const DisplayCleaningComplaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle styles = const TextStyle(
      color: Colors.black,
      fontSize: 15,
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/736x/f4/c7/c7/f4c7c774933d1cf1487e59296b2351c1--a-r-iphone-wallpaper.jpg'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                                image: NetworkImage(
                                    'https://st2.depositphotos.com/3765753/5349/v/600/depositphotos_53491365-stock-illustration-complaint-red-rubber-stamp-vector.jpg')),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(
                        child: Text(
                          'Complaint Details',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    height: 70,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Username: ',style: styles,),
                          Text(controller.cleaningComplaintsList[controller.touchCleaning].username,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Email/Mobile: ',style: styles,),
                          Text(controller.cleaningComplaintsList[controller.touchCleaning].phone,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Building: ',style: styles,),
                              Text(controller.cleaningComplaintsList[controller.touchCleaning].hostel,style: styles,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Block: ',style: styles,),
                              Text(controller.cleaningComplaintsList[controller.touchCleaning].block,style: styles,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 170,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Floor: ',style: styles,),
                              Text(controller.cleaningComplaintsList[controller.touchCleaning].floor,style: styles,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 170,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Room: ',style: styles,),
                              Text(controller.cleaningComplaintsList[controller.touchCleaning].room,style: styles,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Type: ',style: styles,),
                          Text(controller.cleaningComplaintsList[controller.touchCleaning].cleaningtype,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Preferred Date: ',style: styles,),
                          Text(controller.cleaningComplaintsList[controller.touchCleaning].date,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Preferred Timing: ',style: styles,),
                          Text(controller.cleaningComplaintsList[controller.touchCleaning].time,style: styles,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.orangeAccent),
                      child: TextButton(
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
