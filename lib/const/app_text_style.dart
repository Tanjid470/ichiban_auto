import 'package:flutter/material.dart';

import 'app_color.dart';
import 'dynamic_font.dart';

TextStyle customSize(double size, Color color) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
      letterSpacing: 5,
    );
TextStyle customSizeWithoutLetterSpacing(double size, Color color) => TextStyle(
  fontSize: size,
  fontWeight: FontWeight.bold,
  color: color,
);

TextStyle customStyleTitle(double size) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: AppColors.baseColorRed,
    );
