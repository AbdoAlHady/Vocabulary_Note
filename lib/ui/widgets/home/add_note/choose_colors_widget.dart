import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/helpers/spacing.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_cubit.dart';

class ChooseColorsWidget extends StatelessWidget {
  const ChooseColorsWidget({super.key, required this.activeColor});
  final int activeColor;
  final List<int> _colorCodes = const [
    0XFF4A47A3,
    0XFF0C7B93,
    0xFF892CDC,
    0XFFBC6FF1,
    0xFFF4ABC4,
    0XFFC70039,
    0xFF8FBC8F,
    0xFFFA8072,
    0XFF4D4C7D,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.read<WriteNoteCubit>().updateColor(_colorCodes[index]);
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(_colorCodes[index]),
                  border: Border.all(
                    color: activeColor == _colorCodes[index]
                        ? context.isDark()? Colors.white:AppColors.dark
                        : Colors.transparent,
                    width: 1.5.w,
                  ),
                ),
                
                child: activeColor == _colorCodes[index]
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : null,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return horizontalSpace(5);
          },
          itemCount: _colorCodes.length),
    );
  }
}
