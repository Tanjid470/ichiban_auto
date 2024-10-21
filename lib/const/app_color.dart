import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static Color themeColor = Colors.red;
  static  Color themeColorShade200 = Colors.red.shade200;
  static Gradient bgGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.grey,
      Colors.red
    ],
  );
}