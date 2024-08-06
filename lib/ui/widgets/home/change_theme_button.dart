import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/core/app/cubit/app_cubit.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return IconButton(
          icon:  Icon(
           context.read<AppCubit>().isDark?Icons.light_mode_outlined :   Icons.dark_mode_outlined,
            size: 35,
            color: AppColors.primary,
          ),
          onPressed: () {
            context.read<AppCubit>().changeAppThemeMode();
          },
        );
      },
    );
  }
}
