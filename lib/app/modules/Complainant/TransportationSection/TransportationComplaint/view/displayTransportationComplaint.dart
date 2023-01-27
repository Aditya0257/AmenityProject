import 'package:amenityfinal/app/modules/Complainant/TransportationSection/TransportationComplaint/controller/transportationComplaintController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayTransportationComplaint
    extends GetView<TransportationComplaintController> {
      static const route = '/displayTransportation-complaint';
  static launch() => Get.toNamed(route);
  const DisplayTransportationComplaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
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
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: const Icon(
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
                          children: const [
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
                  const SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(
                        child: Text(
                      'Transport Complaint',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    )),
                  ),
                  const SizedBox(
                    width: 300,
                    height: 70,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 370,
                    height: 40,
                    child: Row(
                      children: [
                        const Text(
                          'Username:  ',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18),
                        ),
                        Text(controller
                            .transportationComplaintList[controller.touch]
                            .usrname),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 370,
                    height: 40,
                    child: Row(
                      children: [
                        const Text(
                          'Email/mobile:  ',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18),
                        ),
                        Text(controller
                            .transportationComplaintList[controller.touch]
                            .mobl),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 370,
                    height: 40,
                    child: Row(
                      children: [
                        const Text(
                          'Vehicle:  ',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 18),
                        ),
                        Text(controller
                            .transportationComplaintList[controller.touch]
                            .vhcle),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Problem:  ',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 18),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(controller
                                .transportationComplaintList[controller.touch]
                                .prblm),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.orangeAccent),
                      child: TextButton(
                        child: const Text(
                          'Back',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        onPressed: () {
                          Get.back();
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
