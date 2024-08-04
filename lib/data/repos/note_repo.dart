import 'package:flutter/material.dart';
import 'package:vocabulary_note/core/enums/enums.dart';
import 'package:vocabulary_note/helpers/hive_service.dart';

import '../models/note_model.dart';

class NoteRepo {
  final noteBox = HiveService().noteBox;

  List<NoteModel> get getNotesFromDatabase {
    final noteList = noteBox!.values.toList();
    for (int i = 0; i < noteList.length; i++) {
      debugPrint(
          '==============${noteList[i].indexAddDataBase}================');
    }

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

  // Delete the note from the database by index
  Future<void> deleteNoteFromDatabase(int index) async {
    var noteList = getNotesFromDatabase;
    int indexAtDatabase =
        noteList.indexWhere((element) => element.indexAddDataBase == index);
    await noteBox!.delete(noteList[indexAtDatabase].key);
  }

  // Get the note from the database by index
  Future<List<NoteModel>> getAllNoteFromDatabase(
      {required LanguageFilter languageFilter,
      required SortedBy sortedBy,
      required SortType sortType}) async {
    var noteList = getNotesFromDatabase;
    _removeUnWantedWords(noteList, languageFilter);
    _applySorting(noteList, sortedBy, sortType);
    return noteList;
  }

  void _removeUnWantedWords(
      List<NoteModel> noteList, LanguageFilter languageFilter) {
    if (languageFilter == LanguageFilter.all) {
      return;
    }

    for (var i = 0; i < noteList.length; i++) {
      if (languageFilter == LanguageFilter.arabicOnly &&
              noteList[i].isArabic == false ||
          languageFilter == LanguageFilter.englishOnly &&
              noteList[i].isArabic == true) {
        noteList.removeAt(i);
        i--;
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
    } else {
      noteList.sort((a, b) => a.text.length.compareTo(b.text.length));
      if (sortType == SortType.ascending) {
        return;
      }
      _reverseList(noteList);
    }
  }

  _reverseList(List<NoteModel> noteList) {
    for (int i = 0; i < noteList.length ~/ 2; i++) {
      final temp = noteList[i];
      noteList[i] = noteList[noteList.length - i - 1];
      noteList[noteList.length - i - 1] = temp;
    }
  }

  void addSimilarWord(NoteModel noteModel, String text, bool isArabic) {
    if (isArabic) {
      noteModel.similarArabicWords.add(text);
      noteModel.save();
    }else{
      noteModel.similarEnglishWords.add(text);
      noteModel.save();
    }
  }
   void addExamples(NoteModel noteModel, String text, bool isArabic) {
    if (isArabic) {
      noteModel.arabicExample.add(text);
      noteModel.save();
    }else{
      noteModel.englishExample.add(text);
      noteModel.save();
    }
  }

  void deleteSimilarWord(NoteModel noteModel, String text, bool isArabic) {
    if (isArabic) {
      noteModel.similarArabicWords.remove(text);
      noteModel.save();
    }else{
      noteModel.similarEnglishWords.remove(text);
      noteModel.save();
    }
  }

  void deleteExample(NoteModel noteModel, String text, bool isArabic) {
    if (isArabic) {
      noteModel.arabicExample.remove(text);
      noteModel.save();
    }else{
      noteModel.englishExample.remove(text);
      noteModel.save();
    }
  }
}
