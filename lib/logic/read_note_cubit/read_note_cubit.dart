import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_state.dart';

class ReadNoteCubit extends Cubit<ReadNoteState> {
  ReadNoteCubit() : super(const ReadNoteInitialState());

  bool isArabic = true;
  String text = '';
  int colorCode = 0xFF4CAF50;

  void updateLanguage(bool isArabic) {
    this.isArabic = isArabic;
    emit(const ReadNoteInitialState());
  }

  void updateText(String text) {
    this.text = text;
    emit(const ReadNoteInitialState());
  }

  void updateColor(int colorCode) {
    this.colorCode = colorCode;
    emit(const ReadNoteInitialState());
  }
}
