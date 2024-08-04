import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/data/models/note_model.dart';
import 'package:vocabulary_note/data/repos/note_repo.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_state.dart';

class WriteNoteCubit extends Cubit<WriteNoteState> {
  final NoteRepo _repo;
  WriteNoteCubit(this._repo) : super(WriteNoteInitialState());

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

  Future<void> addNote() async {
    emit(WriteNoteLoadingState());
    try {
      _repo.addNoteToDatabase(
        isArabic: isArabic,
        text: text,
        colorCode: colorCode,
      );
      emit(WriteNoteSuccessState());
      debugPrint('======== Added Note Successfully =========');
    } catch (e) {
      debugPrint('======== Added Note Failed : $e =========');
      emit(WriteNoteErrorState(
          errorMessage: "something went wrong , please try again later"));
    }
  }

  void deleteNoteFormDatabase(int indexAtDatabase) async {
    emit(WriteNoteLoadingState());
    try {
      _repo.deleteNoteFromDatabase(indexAtDatabase);
      emit(WriteNoteSuccessState());
      debugPrint('======== Deleted Note Successfully =========');
    } catch (e) {
      debugPrint('======== Deleted Note Failed : $e =========');
      emit(WriteNoteErrorState(
          errorMessage: "something went wrong , please try again later"));
    }
  }

  void addSimilarWord(NoteModel noteModel) {
    emit(WriteNoteLoadingState());
    try {
      _repo.addSimilarWord(noteModel, text, isArabic);
      emit(AddSimilarWordOrExampleSuccessState());
      debugPrint('======== Added Similar Word Successfully =========');
    } catch (e) {
      debugPrint('======== Added Similar Word Failed : $e =========');
      emit(WriteNoteErrorState(
          errorMessage: "something went wrong , please try again later"));
    }
  }

  void deleteSimilarWord(NoteModel noteModel, String word, bool isArabic) {
    emit(WriteNoteLoadingState());
    try {
      _repo.deleteSimilarWord(noteModel, word, isArabic);
      emit(DeleteSimilarWordOrExampleSuccessState());
      debugPrint('======== Deleted Similar Word Successfully =========');
    } catch (e) {
      debugPrint('======== Deleted Similar Word Failed : $e =========');
      emit(WriteNoteErrorState(
          errorMessage: "something went wrong , please try again later"));
    }

  }

  void addExample(NoteModel noteModel) {
    emit(WriteNoteLoadingState());
    try {
      _repo.addExamples(noteModel, text, isArabic);
      emit(AddSimilarWordOrExampleSuccessState());
      debugPrint('======== Added Example Successfully =========');
    } catch (e) {
      debugPrint('======== Added Example Failed : $e =========');
      emit(WriteNoteErrorState(
          errorMessage: "something went wrong , please try again later"));
    }
  }
}
