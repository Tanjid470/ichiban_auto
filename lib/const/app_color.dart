import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static Color baseColorRed = const Color(0xffd71f26);
  static Color baseColorGrey = const Color(0xff808282);
  static  Color themeColorShade200 = baseColorRed.withOpacity(.5);
  static Gradient bgGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.grey,
      Colors.red
    ],
  );
}