import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/theme/app_text_styles.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/data/models/note_model.dart';

class WordInfoWidget extends StatelessWidget {
  const WordInfoWidget({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(noteModel.colorCode),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 30,
          backgroundColor:
              context.isDark() ? AppColors.dark : AppColors.white,
          child: Text(
            noteModel.isArabic ? 'ar' : 'en',
            style: TextStyle(color: Color(noteModel.colorCode)),
          ),
        ),
        title: Text(
          noteModel.text,
          style: AppTextStyles.font18DarkBold.copyWith(
              color: context.isDark() ? AppColors.dark : AppColors.white),
        ),
      ),
    );
  }
}
