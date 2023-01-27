import 'package:amenityfinal/app/modules/Complainant/DrawerComplainant/controller/chattingSectionController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';

class ChattingSection extends GetView<ChattingSectionController> {
  const ChattingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://image.winudf.com/v2/image1/Y29tLmhhbmRldnN0ZC5kYXJrLmJsYWNrd2FsbHBhcGVyc19zY3JlZW5fMF8xNjI5MDMxMjkwXzA4Nw/screen-0.jpg?fakeurl=1&type=.jpg'),fit: BoxFit.cover)
          ),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.11,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 20,
                            ),
                            Text('Amenity',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'dosis',
                                    letterSpacing: 1,
                                    color: Colors.white)),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 90,
                          child: Card(
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(60),
                                    topLeft: Radius.circular(60))),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  ZoomDrawer.of(context)!.toggle();
                                },
                                icon: const Icon(
                                  Icons.menu_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            controller: controller.chatController,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Message',
                                labelStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            DateTime now=DateTime.now();
                            String time=now.hour.toString()+':'+now.minute.toString();
                            FirebaseFirestore.instance.collection('chatting').doc(Timestamp.now().toString()).set({
                              'Chat': controller.chatController.text,
                              'username': controller.userId,
                              'time': controller.time,
                            });
                            controller.chatController.clear(
          
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            child: Text(
                              'Send',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                fit: FlexFit.loose,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.transparent,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('chatting').snapshots(),
                    builder: (context, snapshot){
                      List<ChattingMessageBox> chatMessageList = [];
                      if (snapshot.hasData){
                        int indee=0;
                        final message = snapshot.data!.docs;
                        for (var messages in message){
                          indee++;
                          final messageText = messages['Chat'];
                          final docid=messages.id.toString();
                          final String messageusername = messages['username'];
                          final timing=messages['time'];
                          String result=messageusername.substring(0,messageusername.indexOf('@'));
          
                          bool me;
                          if(messageusername==controller.userId){
                            me=true;
                          }
                          else{
                            me=false;
                          }
                          if(indee>100){
                            FirebaseFirestore.instance.runTransaction((Transaction myTrans)async{
                              await myTrans.delete(snapshot.data!.docs[0].reference);
                              chatMessageList.removeAt(0);
                              chatMessageList.add(ChattingMessageBox(text: messageText.toString(),isMe: me,usern: result,idofdocument: docid,time: timing,));
                            });
                          }
                          else{
                            chatMessageList.add(ChattingMessageBox(text: messageText.toString(),isMe: me,usern: result,idofdocument: docid,time: timing,));
                          }
          
                        }
                      }
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5, 35, 5, 0),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: chatMessageList,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChattingMessageBox extends StatelessWidget {
  ChattingMessageBox(
      {super.key,
      required this.text,
      required this.isMe,
      required this.usern,
      required this.idofdocument,
      required this.time});
  String text;
  final bool isMe;
  String usern;
  String idofdocument;
  String time;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        FocusedMenuHolder(
          menuItems: [
            isMe
                ? FocusedMenuItem(
                    title: Text('Delete'),
                    trailingIcon: Icon(Icons.delete),
                    onPressed: () {
                      final docuser = FirebaseFirestore.instance
                          .collection('chatting')
                          .doc(idofdocument);
                      print(idofdocument);
                      docuser.delete();
                    })
                : FocusedMenuItem(
                    title: Text('Back'),
                    trailingIcon: Icon(Icons.arrow_back_ios),
                    onPressed: () {}),
          ],
          menuWidth: MediaQuery.of(context).size.width * 0.50,
          blurSize: 5.0,
          menuItemExtent: 45,
          menuBoxDecoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          duration: Duration(milliseconds: 100),
          animateMenuItems: true,
          blurBackgroundColor: Colors.black54,
          bottomOffsetHeight: 100,
          openWithTap: false,
          onPressed: () {},
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.60),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: isMe ? Colors.white : Colors.greenAccent,
                borderRadius: isMe
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))
                    : const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    usern,
                    style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(text),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
