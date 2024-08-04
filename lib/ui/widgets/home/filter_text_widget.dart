import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/core/enums/enums.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/theme/app_text_styles.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_cubit.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_state.dart';

class FilterTextWidget extends StatelessWidget {
  const FilterTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNoteCubit, ReadNoteState>(
      builder: (context, state) {
        var cubit = context.read<ReadNoteCubit>();
        return Text(
          _getFilterText(cubit.languageFilter),
          style: AppTextStyles.font18DarkBold.copyWith(
              color: context.isDark() ? AppColors.white : AppColors.dark),
        );
      },
    );
  }

  String _getFilterText(LanguageFilter filter) {
    switch (filter) {
      case LanguageFilter.all:
        return 'All Languages';
      case LanguageFilter.englishOnly:
        return 'English Word';
      case LanguageFilter.arabicOnly:
        return 'Arabic Word';
      default:
        return 'All Languages';
    }
  }
}
