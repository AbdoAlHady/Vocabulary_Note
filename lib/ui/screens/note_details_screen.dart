import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/core/di/depndancy_injection.dart';
import 'package:vocabulary_note/core/theme/app_colors.dart';
import 'package:vocabulary_note/data/models/note_model.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_cubit.dart';
import 'package:vocabulary_note/ui/widgets/details/note_details_body.dart';

class NoteDetailsScreen extends StatelessWidget {
  const NoteDetailsScreen({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WriteNoteCubit(getIt()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Details Screen'),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    context.read<WriteNoteCubit>().deleteNoteFormDatabase(noteModel.indexAddDataBase);
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: NoteDetailsBody(
                noteModel: noteModel,
              ),
            )),
          );
        }
      ),
    );
  }
}
