import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/transportServiterNoticeController.dart';

class DisplayTransportServiterNotice extends GetView<TransportServiterNoticeController> {
  static const route = '/transportServiter-noticeDisplay';
  static launch() => Get.toNamed(route);
  const DisplayTransportServiterNotice({Key? key}) : super(key: key);

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
                      'https://i.pngimg.me/thumb/f/720/comrawpixel6195913.jpg'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: 350,
                    height: 600,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: Colors.transparent,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'NOTICE',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text(
                                'Subject',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              SizedBox(
                                  width: 250,
                                  height: 40,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        controller.transportServiterNoticeList[controller.touchTransportServiter].sub,
                                        maxLines: null,
                                        style: const TextStyle(fontSize: 15),
                                      ))),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text(
                                'Body :',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              Container(
                                width: 250,
                                height: 400,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white38,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        controller.transportServiterNoticeList[controller.touchTransportServiter].bod,
                                        style: const TextStyle(fontSize: 15),
                                      )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 1,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}