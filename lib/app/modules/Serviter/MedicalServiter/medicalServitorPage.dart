import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import 'MedicalServiterEmergency/view/medicalServiterEmergency.dart';
import 'MedicalServiterHome/view/medicalServiterHome.dart';
import 'MedicalServiterQueries/view/medicalServiterQueries.dart';

enum _SelectedTab { home, air, clean, profile }

class MedicalServiter extends StatefulWidget {
    static const route = '/medical-serviter';
  static launch() => Get.toNamed(route);
  const MedicalServiter({Key? key}) : super(key: key);

  @override
  State<MedicalServiter> createState() => _MedicalServiterState();
}

class _MedicalServiterState extends State<MedicalServiter> {
  var _selectedTab = _SelectedTab.home;
  int x = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      x = i;
    });
  }

  var y = const [MedicalServiterHome(), MedicalEmergencyServices(), MedicalQueriesServices(), MedicalServiterHome()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        backgroundColor: Colors.white24,
        dotIndicatorColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.add),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.question_mark_rounded),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          ZoomDrawer.of(context)!.toggle();
                        },
                        icon: Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                          size: 35,
                        )),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      child: Image(
                        image: NetworkImage(
                            'https://media.istockphoto.com/vectors/avatar-line-icon-on-black-background-black-flat-style-vector-vector-id1161086158?k=20&m=1161086158&s=170667a&w=0&h=1e9HO7d7nWl89qoOZoCKMFPeKZODqMQ7qjuXIAu9_vw='),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                )
              ],
            ),
            y[x],
          ],
        ),
      ),
    );
  }
}