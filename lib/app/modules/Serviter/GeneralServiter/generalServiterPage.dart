import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';


import 'GeneralServiterAC/view/generalServiterAc.dart';
import 'GeneralServiterCleaning/view/generalServiterCleaning.dart';
import 'GeneralServiterHome/view/generalServiterHome.dart';
import 'GeneralServiterWifi/view/generalServiterWifi.dart';



enum _SelectedTab { home,air, clean, wifi,profile}

class GeneralServiter extends StatefulWidget {
    static const route = '/general-serviter';
  static launch() => Get.toNamed(route);
  const GeneralServiter({Key? key}) : super(key: key);

  @override
  State<GeneralServiter> createState() => _GeneralServiterState();
}

class _GeneralServiterState extends State<GeneralServiter> {
  var _selectedTab = _SelectedTab.home;
  int x= 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      x=i;
    });
  }

  


  var y= const[ GeneralServiterHome(),AirConditionerServices(),CleaningServices(),WifiServices(),GeneralServiterHome()];
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
            icon: Icon(Icons.air),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.cleaning_services_rounded),
          ),

          DotNavigationBarItem(
            icon: Icon(Icons.wifi_2_bar),
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
                    SizedBox(width: 20,),
                    IconButton(
                      onPressed: (){
                        ZoomDrawer.of(context)!.toggle();
                      },
                        icon: Icon(Icons.menu_rounded,color: Colors.white, size: 35,)),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Image(image: NetworkImage('https://media.istockphoto.com/vectors/avatar-line-icon-on-black-background-black-flat-style-vector-vector-id1161086158?k=20&m=1161086158&s=170667a&w=0&h=1e9HO7d7nWl89qoOZoCKMFPeKZODqMQ7qjuXIAu9_vw='),),
                    ),
                    SizedBox(width: 20,)
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