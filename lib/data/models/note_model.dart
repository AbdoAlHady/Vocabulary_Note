import 'package:hive_flutter/hive_flutter.dart';

class NoteModel extends HiveObject {
  final int indexAddDataBase;
  final String text;
  final int colorCode;
  final bool isArabic;
  List<String> similarArabicWords;
  List<String> similarEnglishWords;
  List<String> arabicExample;
  List<String> englishExample;

  NoteModel({
    required this.indexAddDataBase,
    required this.text,
    required this.colorCode,
    required this.isArabic,
    List<String>? similarArabicWords,
    List<String>? similarEnglishWords,
    List<String>? arabicExample,
    List<String>? englishExample,
  })  : similarArabicWords = similarArabicWords ?? [],
        similarEnglishWords = similarEnglishWords ?? [],
        arabicExample = arabicExample ?? [],
        englishExample = englishExample ?? [];
}
