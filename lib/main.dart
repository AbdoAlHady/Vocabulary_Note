import 'package:flutter/material.dart';
import 'package:vocabulary_note/helpers/hive_service.dart';
import 'package:vocabulary_note/vocabulary_note_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  runApp(const VocabularyNoteApp());
}
