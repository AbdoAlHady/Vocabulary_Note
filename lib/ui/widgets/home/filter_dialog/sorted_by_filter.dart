import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/core/enums/enums.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/theme/app_text_styles.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/helpers/spacing.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_cubit.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_state.dart';
import 'package:vocabulary_note/ui/widgets/home/filter_dialog/filter_buttons_widgets.dart';

class SortedByFilter extends StatelessWidget {
  const SortedByFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNoteCubit, ReadNoteState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sorted by',
              style: AppTextStyles.font18DarkMedium.copyWith(
                  color: context.isDark() ? AppColors.white : AppColors.dark),
            ),
            verticalSpace(10),
            FilterButtonsWidgets(labels: const [
              'Time',
              'Word length',
            ], onTaps: [
              () => context.read<ReadNoteCubit>().setSortedBy(SortedBy.time),
              () => context
                  .read<ReadNoteCubit>()
                  .setSortedBy(SortedBy.wordLength),
            ], conditions: [
              context.read<ReadNoteCubit>().sortedBy == SortedBy.time,
              context.read<ReadNoteCubit>().sortedBy == SortedBy.wordLength,
            ]),
          ],
        );
      },
    );
  }
}
