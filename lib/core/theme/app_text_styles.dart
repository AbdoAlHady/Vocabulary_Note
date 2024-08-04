import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';

abstract class AppTextStyles{



  static TextStyle font15WhiteBold= TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static  TextStyle font18DarkMedium= TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w100,
    color: AppColors.dark,
  );

  static  TextStyle font18DarkBold= TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );


}