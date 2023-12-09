import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static const TextStyle bigPlus = TextStyle(
     fontFamily: 'Helvetica',
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static const TextStyle big = TextStyle(
     fontFamily: 'Helvetica',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static const TextStyle h1Bold = TextStyle(
     fontFamily: 'Helvetica',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static const TextStyle h2Bold = TextStyle(
     fontFamily: 'Helvetica',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static const TextStyle h3Bold = TextStyle(
     fontFamily: 'Helvetica',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static const TextStyle h4Bold = TextStyle(
     fontFamily: 'Helvetica',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static const TextStyle h4Normal = TextStyle(
     fontFamily: 'Helvetica',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
  );
  static const TextStyle thinSmall = TextStyle(
     fontFamily: 'Helvetica',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
  );
  static const TextStyle boldSmall = TextStyle(
     fontFamily: 'Helvetica',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static withColor({required Color color, required TextStyle style}) =>
      style.copyWith(color: color);

  static withSize({required TextStyle style, required FontWeight weight}) {}
}