import 'package:flutter/material.dart';
import 'package:ichiban_auto/const/app_color.dart';
import 'package:ichiban_auto/const/dynamic_font.dart';

class CustomTextFormat extends StatelessWidget {

  final String title;
  final String subtitle;

  const CustomTextFormat({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$subtitle : ",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: TextSize.font16(context),
                color: AppColors.baseColorGrey
            )
        ),
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: TextSize.font16(context),
                color: Colors.black
            )
        ),
      ],
    );
  }
}