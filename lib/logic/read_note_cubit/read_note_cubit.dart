import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_note/core/enums/enums.dart';
import 'package:vocabulary_note/data/repos/note_repo.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_state.dart';

class ReadNoteCubit extends Cubit<ReadNoteState> {
  final NoteRepo _repo;
  ReadNoteCubit(this._repo) : super(ReadNoteInitial());

  LanguageFilter languageFilter = LanguageFilter.all;
  SortedBy sortedBy = SortedBy.time;
  SortType sortType = SortType.descending;

  void setLanguageFilter(LanguageFilter languageFilter) {
    this.languageFilter = languageFilter;
    emit(ReadNoteInitial());
    getNotesFromDatabase();
  }

  void setSortedBy(SortedBy sortedBy) {
    this.sortedBy = sortedBy;
    emit(ReadNoteInitial());
    getNotesFromDatabase();
  }

  void setSortType(SortType sortType) {
    this.sortType = sortType;
    emit(ReadNoteInitial());
    getNotesFromDatabase();
  }

  void getNotesFromDatabase() async {
    emit(ReadNoteLoadingState());
    try {
      final noteList = await _repo.getAllNoteFromDatabase(
          languageFilter: languageFilter,
          sortedBy: sortedBy,
          sortType: sortType);
      emit(ReadNoteSuccessState(noteList: noteList));
      debugPrint('======== Get notes from database success ========');
    } catch (e) {
      emit(ReadNoteErrorState(
          message: 'something went wrong ,please try again'));
      debugPrint('======== Get notes from database error :$e ========');
    }
  }
}
