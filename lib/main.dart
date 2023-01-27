import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app.dart';
import 'helper/shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
