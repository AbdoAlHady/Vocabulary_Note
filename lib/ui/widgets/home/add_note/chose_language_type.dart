import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/theme/app_text_styles.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/helpers/spacing.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_cubit.dart';

class ChoseLanguageType extends StatelessWidget {
  const ChoseLanguageType({
    super.key, required this.colorCode, required this.isArabic,
  });

  final int colorCode;
  final bool isArabic;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildChoseLanguageTypeItem(language: 'Ar', isArabicLanguage: true, context:context ),
        horizontalSpace(10),
        _buildChoseLanguageTypeItem(language: 'En', isArabicLanguage: false, context: context),
      ],
    );
  }

  Widget _buildChoseLanguageTypeItem({required String language, required bool isArabicLanguage , required BuildContext context}) {
    return InkWell(
      onTap: () {
       context.read<WriteNoteCubit>().updateLanguage(isArabicLanguage);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
          width: 55.w,
          height: 55.h,
          alignment: Alignment.center,
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color: isArabicLanguage ==isArabic? Color(colorCode): null,
            border: Border.all(
              color:context.isDark() ? Colors.white : AppColors.dark,
              width: 2.w,
            ),
          ),
        
          child:Text(
            language,
            style: AppTextStyles.font18DarkMedium.copyWith(
            color: context.isDark() ? Colors.white : AppColors.dark,
            ),
          ),
        ),
    );
  }
}
