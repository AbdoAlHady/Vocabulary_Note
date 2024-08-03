import 'package:flutter/material.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'Poppins' ,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.dark,
    fontFamily: 'Poppins' ,
  );
}
