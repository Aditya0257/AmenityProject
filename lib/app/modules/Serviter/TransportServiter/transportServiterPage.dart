import 'package:amenityfinal/app/modules/Serviter/TransportServiter/TransportServiterChat/view/transportServiterChat.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import 'TransportServiterBook/view/transportServiterBook.dart';
import 'TransportServiterHome/view/transportServiterHome.dart';
import 'TransportServiterNotice/view/transportServiterNotice.dart';

enum _SelectedTab { home, air, clean, wifi, profile }

class TransportServiter extends StatefulWidget {
  static const route = '/transport-serviter';
  static launch() => Get.toNamed(route);
  const TransportServiter({Key? key}) : super(key: key);

  @override
  State<TransportServiter> createState() => _TransportServiterState();
}

class _TransportServiterState extends State<TransportServiter> {
  var _selectedTab = _SelectedTab.home;
  int x = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      x = i;
    });
  }

  var y = const [
    TransportServiterHome(),
    TransportServiterBookings(),
    TransportServiterChat(),
    TransportServiterNotice(),
    TransportServiterHome()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: DotNavigationBar(
        itemPadding: const EdgeInsets.all(10),
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        backgroundColor: Colors.white24,
        dotIndicatorColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.bus_alert),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.book_outlined),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.developer_board),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
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
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          ZoomDrawer.of(context)!.toggle();
                        },
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                          size: 35,
                        )),
                  ],
                ),
                Row(
                  children: const <Widget>[
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
