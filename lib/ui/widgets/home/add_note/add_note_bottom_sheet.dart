import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/helpers/app_loaders.dart';
import 'package:vocabulary_note/helpers/spacing.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_cubit.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_state.dart';
import 'package:vocabulary_note/ui/widgets/home/add_note/add_note_button.dart';
import 'package:vocabulary_note/ui/widgets/home/add_note/choose_colors_widget.dart';
import 'package:vocabulary_note/ui/widgets/home/add_note/chose_language_type.dart';
import 'package:vocabulary_note/ui/widgets/home/add_note/note_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({
    super.key,
  });

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WriteNoteCubit, WriteNoteState>(
      listener: (context, state) {
        if (state is WriteNoteSuccessState) {
          Navigator.of(context).pop();
          AppLoaders.showToastSuccess(context: context, message: 'Note Added Successfully');
        }else if (state is WriteNoteErrorState) {
          AppLoaders.showToastError(context: context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        var cubit = context.read<WriteNoteCubit>();
        return AbsorbPointer(
          absorbing: state is WriteNoteLoadingState? true: false,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            width: double.infinity,
            padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                top: 12.h,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ChoseLanguageType(
                      isArabic: cubit.isArabic, colorCode: cubit.colorCode),
                  verticalSpace(15),
                  ChooseColorsWidget(
                    activeColor: cubit.colorCode,
                  ),
                  verticalSpace(15),
                  NoteTextField(
                    label: 'New Word',
                    formKey: formKey,
                  ),
                  verticalSpace(15),

                  state is WriteNoteLoadingState ?SizedBox(
                    height: 40.h,
                    width:40.w,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  ) :DoneButton(
                    colorCode: cubit.colorCode,
                    onTap: () async{
                      if (formKey.currentState!.validate()) {
                        await  cubit.addNote();
                      }
                    },
                  ),
                  verticalSpace(15),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
