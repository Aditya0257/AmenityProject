import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/transportServiterNoticeController.dart';

class AddNewTransportServiterNotice extends GetView<TransportServiterNoticeController> {
  static const route = '/transportServiter-addNewNotice';

  const AddNewTransportServiterNotice({super.key});
  static launch() => Get.toNamed(route);
 
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
                                height: 50,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    controller: controller.subjectController,
                                    decoration: const InputDecoration(
                                      labelText: 'Subject of Notice',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 18,
                                      controller: controller.bodyController,
                                      decoration: const InputDecoration(
                                        labelText: 'Body of Notice',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('notice')
                            .doc(Timestamp.now().toString())
                            .set({
                          'body': controller.bodyController.text,
                          'subject': controller.subjectController.text,
                          'username': controller.loggeduser.email,
                        });
                        controller.transportServiterNoticeList.clear();
                        Get.back();
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.blueAccent),
                        child: const Center(
                            child: Text(
                          'Post',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}