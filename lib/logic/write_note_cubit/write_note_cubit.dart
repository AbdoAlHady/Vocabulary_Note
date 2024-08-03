import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/data/models/note_model.dart';
import 'package:vocabulary_note/helpers/hive_service.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_state.dart';

class WriteNoteCubit extends Cubit<WriteNoteState> {
  WriteNoteCubit() : super(WriteNoteInitialState());

  WriteNoteCubit get(context) => BlocProvider.of<WriteNoteCubit>(context);

  bool isArabic = true;
  String text = '';
  int colorCode = 0XFF4A47A3;

  void updateLanguage(bool isArabic) {
    this.isArabic = isArabic;
    emit(WriteNoteInitialState());
  }

  void updateText(String text) {
    this.text = text;
    emit(WriteNoteInitialState());
  }

  void updateColor(int colorCode) {
    this.colorCode = colorCode;
    emit(WriteNoteInitialState());
  }

  List<NoteModel> _getNotesFromDataBase() {
    final box = HiveService().noteBox;
    final notes = box!.values.toList();
    return notes;
  }

  Future<void> addNote() async {
    emit(WriteNoteLoadingState());
    try {
      final notesList = _getNotesFromDataBase();
      final box = HiveService().noteBox;
      final noteModel = NoteModel(
        text: text,
        colorCode: colorCode,
        isArabic: isArabic,
        indexAddDataBase: notesList.length,
      );
      await box!.add(noteModel);
      emit(WriteNoteSuccessState());
      debugPrint('======== Added Note Successfully =========');
    } catch (e) {
      debugPrint('======== Added Note Failed : $e =========');
      emit(WriteNoteErrorState(errorMessage: "something went wrong , please try again later"));
    }
  }
}
