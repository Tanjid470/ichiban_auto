import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';


Container animationText() {
  return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: AnimatedTextKit(repeatForever: true, animatedTexts: [
        ColorizeAnimatedText('ICHIBANAUTO',
            textStyle:  const TextStyle(
                color: Colors.grey,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500),
            colors:const [
              Colors.red,
              Colors.grey,
              Colors.red,
            ],
            speed: const Duration(seconds: 3))
      ]));
}