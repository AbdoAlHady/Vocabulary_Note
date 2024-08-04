import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/theme/app_text_styles.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/data/models/note_model.dart';
import 'package:vocabulary_note/helpers/spacing.dart';
import 'package:vocabulary_note/ui/widgets/details/word_info_widget.dart';

class NoteDetailsBody extends StatelessWidget {
  const NoteDetailsBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHeading(
          colorCode: noteModel.colorCode,
          label: 'Word',
        ),
        verticalSpace(10),
        WordInfoWidget(noteModel: noteModel),
        verticalSpace(20),
        TitleHeading(
          colorCode: noteModel.colorCode,
          label: 'Similar Words',
          onTap: () {},
        ),
        verticalSpace(20),
        TitleHeading(
          colorCode: noteModel.colorCode,
          label: 'Examples',
          onTap: () {},
        ),
      ],
    );
  }
}

class TitleHeading extends StatelessWidget {
  const TitleHeading({
    super.key,
    required this.label,
    this.onTap,
    required this.colorCode,
  });
  final String label;
  final VoidCallback? onTap;
  final int colorCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: AppTextStyles.font18DarkMedium.copyWith(
            color: context.isDark() ? AppColors.white : AppColors.dark,
          ),
        ),
        const Spacer(),
        if (onTap != null)
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(colorCode),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.add,
                color: context.isDark() ? AppColors.dark : AppColors.white,
              ),
            ),
          )
      ],
    );
  }
}