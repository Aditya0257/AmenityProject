import 'package:amenityfinal/utils/colors.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: AppColors.green,
      fontFamily: 'RedHat',
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: const ColorScheme.light(primary: AppColors.green));
}