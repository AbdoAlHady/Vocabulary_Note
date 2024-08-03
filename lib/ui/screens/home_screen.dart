import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/helpers/spacing.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_cubit.dart';
import 'package:vocabulary_note/ui/widgets/home/add_note/add_note_bottom_sheet.dart';
import 'package:vocabulary_note/ui/widgets/home/home_app_bar.dart';

import '../widgets/home/home_body.dart';
import '../widgets/home/home_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: context.isDark() ? AppColors.dark : AppColors.white,
            builder: (context) => BlocProvider(
              create: (context) => WriteNoteCubit(),
              child: const AddNoteBottomSheet(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: HomeFilter()),
            SliverToBoxAdapter(child: verticalSpace(10)),
            const HomeBody(),
          ],
        ),
      ),
    );
  }
}
