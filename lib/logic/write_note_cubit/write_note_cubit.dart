import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_state.dart';

class WriteNoteCubit extends Cubit<WriteNoteState> {
  WriteNoteCubit() : super( WriteNoteInitialState());

  WriteNoteCubit get(context) => BlocProvider.of<WriteNoteCubit>(context);

  bool isArabic = true;
  String text = '';
  int colorCode = 0XFF4A47A3;

  void updateLanguage(bool isArabic) {
    this.isArabic = isArabic;
    emit( WriteNoteInitialState());
  }

  void updateText(String text) {
    this.text = text;
    emit( WriteNoteInitialState());
  }

  void updateColor(int colorCode) {
    this.colorCode = colorCode;
    emit( WriteNoteInitialState());
  }
}
