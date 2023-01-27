import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          elevation: 10,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),

          title: const Center(child: Text('Invalid!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),)),
          content: SizedBox(
            width: double.maxFinite,
            height: 40,
            child: Column(
              children: const [
                Text('Inputs are invalid', style: TextStyle(fontSize: 17 ,color: Colors.grey),),
                Text('Please enter valid data', style: TextStyle(fontSize: 17,color: Colors.grey ),),
              ],
            ),
          ),
          actions:[TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )]
      );
    },
  );
}