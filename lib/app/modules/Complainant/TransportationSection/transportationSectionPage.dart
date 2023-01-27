import 'package:amenityfinal/app/modules/Complainant/TransportationSection/TransportationComplaint/view/transportationComplaint.dart';
import 'package:flutter/material.dart';
import 'package:amenityfinal/app/modules/Complainant/TransportationSection/TransportationBooking/view/transportationBooking.dart';
import 'package:amenityfinal/app/modules/Complainant/TransportationSection/TransportationNotice/view/transportationNotice.dart';

class TransportSectionPage extends StatefulWidget {
  const TransportSectionPage({Key? key}) : super(key: key);

  @override
  State<TransportSectionPage> createState() => _TransportSectionPageState();
}

class _TransportSectionPageState extends State<TransportSectionPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: Container()),
        const Expanded(
            flex: 1,
            child: Text(
              'TRANSPORTATION',
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'abcd',
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            )),
        Expanded(
            flex: 4,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 120,
              child: Image.network(
                'https://imgs.search.brave.com/Ku_CAhN2_41XfZsQEjBLc5DNyc8ZRi6PxVf2m4N0OkQ/rs:fit:760:283:1/g:ce/aHR0cDovL3d3dy5w/bmdtYXJ0LmNvbS9m/aWxlcy8xMS9Mb2dp/c3RpY3MtVHJhbnNw/b3J0LVBORy1UcmFu/c3BhcmVudC1QaWN0/dXJlLnBuZw',
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  return child;
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.04),
                      radius: 120,
                    );
                  }
                },
                scale: 4,
              ),
            )),
        Expanded(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Transportation Section',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'abcd'),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 200,
                        child: Divider(
                          thickness: 2.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      TransportationBooking.launch();
                    },
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 50,
                        ),
                        Icon(
                          Icons.bus_alert_outlined,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Booking',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'abcd'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      const Icon(
                        Icons.book_outlined,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          TransportationComplaint.launch();
                        },
                        child: const Text(
                          'Complaint',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'abcd'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      const Icon(
                        Icons.book,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          TransportationNotice.launch();
                        },
                        child: const Text(
                          'Notice',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'abcd'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
