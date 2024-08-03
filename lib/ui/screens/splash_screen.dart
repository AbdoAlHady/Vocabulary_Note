
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/utis/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
    super.initState();
  }
  @override
  void dispose() {
   controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
              baseColor: AppColors.primary,
              spawnMinSpeed: 15,
              spawnMaxSpeed: 50,
              spawnMaxRadius: 50,
              particleCount: 60,
              spawnOpacity: 0.7),
        ),
        vsync: this,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Center(
            child: CircleAvatar(
              radius: 70,
              backgroundColor: AppColors.primary.withOpacity(0.4),
              child: SvgPicture.asset(
                AppImages.logo,
                width: 100.w,
                height: 100.h,
                color: AppColors.white,
                ),
            ),
          ),
        ),
      ),
    );
  }
}
