import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/core/enums/enums.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_state.dart';

class WriteNoteCubit extends Cubit<WriteNoteState> {
  WriteNoteCubit():super(const WriteNoteInitialState());
  LanguageFilter languageFilter = LanguageFilter.all;
  SortedBy sortedBy = SortedBy.time;
  SortType sortType = SortType.ascending;

  void updateLanguageFilter(LanguageFilter filter) {
    languageFilter = filter;
    emit(const WriteNoteInitialState());

  }

  void updateSortedBy(SortedBy sortedBy) {
    this.sortedBy = sortedBy;
    emit(const WriteNoteInitialState());
  }

  void updateSortType(SortType sortType) {
    this.sortType = sortType;
    emit(const WriteNoteInitialState());
  }
}
