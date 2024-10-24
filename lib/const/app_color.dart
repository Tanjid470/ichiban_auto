import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static Color baseColorRed = const Color(0xffd71f26);
  static Color baseColorRedShade100 = const Color(0xffd71f26).withOpacity(.1);
  static Color baseColorGrey = const Color(0xff808282);
  static Color baseColorGreyShade100 = const Color(0xff808282);
  static Gradient bgGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.grey,
      Colors.red
    ],
  );
}