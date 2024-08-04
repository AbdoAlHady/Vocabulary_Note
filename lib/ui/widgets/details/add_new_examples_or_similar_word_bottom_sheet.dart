import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/data/models/note_model.dart';
import 'package:vocabulary_note/helpers/app_loaders.dart';
import 'package:vocabulary_note/helpers/spacing.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_cubit.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_state.dart';
import 'package:vocabulary_note/ui/widgets/home/add_note/add_note_button.dart';
import 'package:vocabulary_note/ui/widgets/home/add_note/choose_colors_widget.dart';
import 'package:vocabulary_note/ui/widgets/home/add_note/note_text_field.dart';

import '../home/add_note/chose_language_type.dart';

class AddNewExamplesOrSimilarWordBottomSheet extends StatefulWidget {
  const AddNewExamplesOrSimilarWordBottomSheet(
      {super.key, required this.isExample, required this.noteModel});
  final bool isExample;
  final NoteModel noteModel;

  @override
  State<AddNewExamplesOrSimilarWordBottomSheet> createState() =>
      _AddNewExamplesOrSimilarWordBottomSheetState();
}

class _AddNewExamplesOrSimilarWordBottomSheetState
    extends State<AddNewExamplesOrSimilarWordBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WriteNoteCubit, WriteNoteState>(
      listener: (context, state) {
        if (state is AddSimilarWordOrExampleSuccessState) {
          Navigator.of(context).pop();
          AppLoaders.showToastSuccess(
              context: context,
              message: widget.isExample
                  ? 'Added Example Successfully'
                  : 'Added Similar Word Successfully');
        } else if (state is WriteNoteErrorState) {
          AppLoaders.showToastError(
              context: context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        var cubit = context.read<WriteNoteCubit>();
        return AbsorbPointer(
          absorbing: state is WriteNoteLoadingState ? true : false,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
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
                    label:
                        widget.isExample ? "New Example" : "New Similar Word",
                    formKey: _formKey,
                  ),
                  verticalSpace(15),
                  state is WriteNoteLoadingState
                      ? SizedBox(
                          height: 40.h,
                          width: 40.w,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                        )
                      : DoneButton(
                          colorCode: widget.noteModel.colorCode,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              cubit.addSimilarWord(widget.noteModel);
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
