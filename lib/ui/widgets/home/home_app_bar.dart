import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DefaultTextStyle(
        style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: context.isDark()?AppColors.white :AppColors.dark),
        child: AnimatedTextKit(
          repeatForever: true,
          pause: const Duration(seconds: 2),
          animatedTexts: [
            TypewriterAnimatedText('Welcome to Your Vocabulary'),
            TypewriterAnimatedText('Discover New Words Today'),
            TypewriterAnimatedText('Unlock New Words Daily'),
          ],
          onTap: () {
          },
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.dark_mode_outlined,
            size: 35,
            color: AppColors.primary,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize =>  Size.fromHeight(50.h);
}
