import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/theme/app_text_styles.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';

class WordInfoWidget extends StatelessWidget {
  const WordInfoWidget({
    super.key,
    required this.label,
    required this.colorCode, required this.isArabic,
  });

  final String label;
  final int colorCode;
  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      decoration: BoxDecoration(
        color: Color(colorCode),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: context.isDark() ? AppColors.dark : AppColors.white,
          child: Text(
            isArabic ? 'ar' : 'en',
            style: TextStyle(color: Color(colorCode)),
          ),
        ),
        title: Text(
          label,
          style: AppTextStyles.font18DarkBold.copyWith(
              color: context.isDark() ? AppColors.dark : AppColors.white),
        ),
      ),
    );
  }
}
