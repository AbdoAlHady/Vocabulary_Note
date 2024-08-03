import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/theme/app_text_styles.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key, required this.colorCode});
  final int colorCode;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 40.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(colorCode),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        onPressed: () {},
        child:  Text('Done',style: AppTextStyles.font18DarkMedium.copyWith(color: AppColors.white),),
      
      ),
    );
  }
}
