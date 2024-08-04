import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/theme/app_text_styles.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';

class FilterButtonsWidgets extends StatelessWidget {
  const FilterButtonsWidgets(
      {super.key,
      required this.labels,
      required this.onTaps,
      required this.conditions});
  final List<String> labels;
  final List<VoidCallback> onTaps;
  final List<bool> conditions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          labels.length,
          (index) => GestureDetector(
            onTap: onTaps[index],
            child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                      border:conditions[index]?null : Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                      color:conditions[index]? AppColors.primary:null),
                  child: Text(
                    labels[index],
                    style: AppTextStyles.font15WhiteBold.copyWith(
                        color: conditions[index] ? AppColors.white : context.isDark()?AppColors.white: AppColors.dark),
                  ),
                ),
          )),
    );
  }
}
