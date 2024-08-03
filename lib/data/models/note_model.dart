import 'package:hive_flutter/hive_flutter.dart';

class NoteModel extends HiveObject {
  final int indexAddDataBase;
  final String text;
  final int colorCode;
  final bool isArabic;
  final List<String> similarArabicWords;
  final List<String> similarEnglishWords;
  final List<String> arabicExample;
  final List<String> englishExample;

  NoteModel({
    required this.indexAddDataBase,
    required this.text,
    required this.colorCode,
    required this.isArabic,
    this.similarArabicWords = const [],
    this.similarEnglishWords = const [],
    this.arabicExample = const [],
    this.englishExample = const [],
  });
}
