import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/helpers/spacing.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_cubit.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_state.dart';
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
    return BlocBuilder<WriteNoteCubit, WriteNoteState>(
      builder: (context, state) {
        var cubit= WriteNoteCubit().get(context);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ChoseLanguageType(isArabic: cubit.isArabic, colorCode: cubit.colorCode),
              verticalSpace(15),
               ChooseColorsWidget(activeColor: cubit.colorCode,),
              verticalSpace(15),
               NoteTextField(label: 'New Word', formKey: formKey,),
            ],
          ),
        );
      },
    );
  }
}
