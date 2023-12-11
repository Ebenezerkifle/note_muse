import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xff161A30);
  static const secondary = Color(0xff31304D);
  static const light = Color(0xffF0ECE5);
  static const danger = Color.fromARGB(255, 255, 0, 0);
  static const grey = Color.fromARGB(255, 97, 97, 97);
  static const background = Color.fromARGB(255, 255, 255, 255);
  static final bgGradient = LinearGradient(
    colors: [
      AppColors.primary.withOpacity(.4),
      AppColors.background
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static final bgGradient2 = LinearGradient(
    colors: [
      AppColors.secondary.withOpacity(.8),
      Colors.white,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}