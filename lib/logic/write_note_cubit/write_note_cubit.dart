import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_state.dart';

class WriteNoteCubit extends Cubit<WriteNoteState> {
  WriteNoteCubit() : super(const WriteNoteInitialState());

  bool isArabic = true;
  String text = '';
  int colorCode = 0xFF4CAF50;

  void updateLanguage(bool isArabic) {
    this.isArabic = isArabic;
    emit(const WriteNoteInitialState());
  }

  void updateText(String text) {
    this.text = text;
    emit(const WriteNoteInitialState());
  }

  void updateColor(int colorCode) {
    this.colorCode = colorCode;
    emit(const WriteNoteInitialState());
  }
}
