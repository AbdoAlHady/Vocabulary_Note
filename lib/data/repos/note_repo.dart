import 'package:vocabulary_note/core/enums/enums.dart';
import 'package:vocabulary_note/helpers/hive_service.dart';

import '../models/note_model.dart';

class NoteRepo {
  final noteBox = HiveService().noteBox;

  List<NoteModel> get getNotesFromDatabase {
    final noteList = noteBox!.values.toList();
    return noteList;
  }

  void addNoteToDatabase(
      {required bool isArabic, required String text, required int colorCode}) {
    final note = NoteModel(
      isArabic: isArabic,
      text: text,
      colorCode: colorCode,
      indexAddDataBase: getNotesFromDatabase.length,
    );
    noteBox!.add(note);
  }

  // Get the note from the database by index
  List<NoteModel> getAllNoteFromDatabase(
      {required LanguageFilter languageFilter,
      required SortedBy sortedBy,
      required SortType sortType}) {
    final noteList = noteBox!.values.toList();
    _removeUnWantedWords(noteList, languageFilter);
    _applySorting(noteList, sortedBy, sortType);
    return noteList;
  }

  void _removeUnWantedWords(
      List<NoteModel> noteList, LanguageFilter languageFilter) {
    if (languageFilter == LanguageFilter.all) {
      return;
    }

    for (var note in noteList) {
      if (languageFilter == LanguageFilter.arabicOnly &&
              note.isArabic == false ||
          languageFilter == LanguageFilter.englishOnly &&
              note.isArabic == true) {
        noteList.remove(note);
      }
    }
  }

  _applySorting(
      List<NoteModel> noteList, SortedBy sortedBy, SortType sortType) {
    if (sortedBy == SortedBy.time) {
      if (sortType == SortType.ascending) {
        return;
      }
      _reverseList(noteList);
    }else{
      noteList.sort((a,b)=>a.text.length.compareTo(b.text.length));
      if(sortType == SortType.ascending){
        return;
      }
      _reverseList(noteList);
    }
  }

  _reverseList(List<NoteModel> noteList) {
   for(int i = 0; i < noteList.length ~/ 2; i++) {
     final temp = noteList[i];
     noteList[i] = noteList[noteList.length - i - 1];
     noteList[noteList.length - i - 1] = temp;
   }
  }
}
