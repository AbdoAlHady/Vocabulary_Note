import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/theme/app_text_styles.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/data/models/note_model.dart';
import 'package:vocabulary_note/helpers/spacing.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_cubit.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_cubit.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_state.dart';
import 'package:vocabulary_note/ui/widgets/details/word_info_widget.dart';

import 'add_new_examples_or_similar_word_bottom_sheet.dart';

class NoteDetailsBody extends StatelessWidget {
  const NoteDetailsBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WriteNoteCubit, WriteNoteState>(
      listener: (context, state) {
        if (state is WriteNoteSuccessState) {
          context.pop();
          context.read<ReadNoteCubit>().getNotesFromDatabase();
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleHeading(
              colorCode: noteModel.colorCode,
              label: 'Word',
            ),
            verticalSpace(10),
            WordInfoWidget(
                label: noteModel.text,
                colorCode: noteModel.colorCode,
                isArabic: noteModel.isArabic),
            verticalSpace(20),
            TitleHeading(
              colorCode: noteModel.colorCode,
              label: 'Similar Words',
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) =>
                        AddNewExamplesOrSimilarWordBottomSheet(
                            isExample: false, noteModel: noteModel));
              },
            ),
            verticalSpace(10),
            for (var similarWord in noteModel.similarArabicWords)
              WordInfoWidget(
                  label: similarWord,
                  colorCode: noteModel.colorCode,
                  isArabic: true),
            for (var similarWord in noteModel.similarEnglishWords)
              WordInfoWidget(
                  label: similarWord,
                  colorCode: noteModel.colorCode,
                  isArabic: false),
            verticalSpace(20),
            TitleHeading(
              colorCode: noteModel.colorCode,
              label: 'Examples',
              onTap: () {},
            ),
          ],
        );
      },
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
