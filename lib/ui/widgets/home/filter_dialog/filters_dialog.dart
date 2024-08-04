import 'package:flutter/material.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/helpers/spacing.dart';
import 'package:vocabulary_note/ui/widgets/home/filter_dialog/language_filter.dart';
import 'package:vocabulary_note/ui/widgets/home/filter_dialog/sorted_by_filter.dart';
import 'package:vocabulary_note/ui/widgets/home/filter_dialog/sorted_type_filter.dart';

class FiltersDialog extends StatelessWidget {
  const FiltersDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.isDark() ? AppColors.dark : AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child:  Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const LanguageFilterWidget(),
            verticalSpace(15),
            const SortedByFilter(),
            verticalSpace(15),
            const SortedTypeFilter()

          ],
        ),
      ),
    );
  }
}
