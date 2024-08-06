import 'package:flutter/material.dart';
import 'package:vocabulary_note/core/di/depndancy_injection.dart';
import 'package:vocabulary_note/helpers/cache_helper.dart';
import 'package:vocabulary_note/helpers/hive_service.dart';
import 'package:vocabulary_note/vocabulary_note_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  await CacheHelper().init();

  await setupDependencyInjection();
  runApp(const VocabularyNoteApp());
}
