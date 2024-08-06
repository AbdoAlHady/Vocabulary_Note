import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/routing/routes.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/core/utis/app_images.dart';
import 'package:vocabulary_note/core/utis/extensions.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_cubit.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_state.dart';
import 'package:vocabulary_note/ui/widgets/exception_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNoteCubit, ReadNoteState>(
      builder: (context, state) {
        if (state is ReadNoteLoadingState || state is ReadNoteInitial) {
          return _buildLoading();
        }
        if (state is ReadNoteErrorState) {
          return _buildError(state.message);
        } else if (state is ReadNoteSuccessState) {
          if (state.noteList.isEmpty) {
            return _buildEmpty();
          } else {
            return _buildSuccess(state);
          }
        }

        return const SizedBox.shrink();
      },
    );
  }

  GridView _buildSuccess(ReadNoteSuccessState state) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
      ),
      itemCount: state.noteList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.pushNamed(Routes.detailsScreen,
                arguments: state.noteList[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(state.noteList[index].colorCode),
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Color(state.noteList[index].colorCode).withOpacity(0.3),
                  Color(state.noteList[index].colorCode)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Center(
              child: Text(
                state.noteList[index].text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmpty() {
    return const ExceptionWidget(
      imageUrl: AppImages.emptyNotes,
      message:
          "You haven't added any notes yet. Create one now to keep track of your vocabulary!.",
    );
  }

  Center _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildError(String message) {
    return ExceptionWidget(
      imageUrl: AppImages.errorImage,
      message: message,
    );
  }
}
