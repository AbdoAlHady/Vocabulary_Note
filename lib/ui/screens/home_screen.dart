import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle(
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          child: AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(seconds: 2),
            animatedTexts: [
              TypewriterAnimatedText('Welcome to Your Vocabulary'),
              TypewriterAnimatedText('Discover New Words Today'),
              TypewriterAnimatedText('Unlock New Words Daily'),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.dark_mode_outlined,
              size: 30,
              color: AppColors.primary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
