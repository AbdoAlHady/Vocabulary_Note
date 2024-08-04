import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/theme/app_text_styles.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/helpers/spacing.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_state.dart';
import 'package:vocabulary_note/ui/widgets/home/filter_dialog/filter_buttons_widgets.dart';

import '../../../../core/enums/enums.dart';
import '../../../../logic/read_note_cubit/read_note_cubit.dart';

class LanguageFilterWidget extends StatelessWidget {
  const LanguageFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNoteCubit, ReadNoteState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language Filter',
              style: AppTextStyles.font18DarkMedium.copyWith(
                  color: context.isDark() ? AppColors.white : AppColors.dark),
            ),
            verticalSpace(10),
            FilterButtonsWidgets(labels: const [
              'All',
              'Arabic',
              'English'
            ], onTaps: [
              () => context
                  .read<ReadNoteCubit>()
                  .setLanguageFilter(LanguageFilter.all),
              () => context
                  .read<ReadNoteCubit>()
                  .setLanguageFilter(LanguageFilter.arabicOnly),
              () => context
                  .read<ReadNoteCubit>()
                  .setLanguageFilter(LanguageFilter.englishOnly),
            ], conditions: [
              context.read<ReadNoteCubit>().languageFilter ==
                  LanguageFilter.all,
              context.read<ReadNoteCubit>().languageFilter ==
                  LanguageFilter.arabicOnly,
              context.read<ReadNoteCubit>().languageFilter ==
                  LanguageFilter.englishOnly,
            ]),
          ],
        );
      },
    );
  }
}
