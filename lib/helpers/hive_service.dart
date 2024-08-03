import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocabulary_note/data/models/note_model.dart';
import 'package:vocabulary_note/data/models/note_model_type_adapter.dart';

class HiveService {
   HiveService._();

  static final HiveService _instance = HiveService._();
  factory HiveService() => _instance;
  Box<NoteModel>? noteBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<NoteModel>(NoteModelTypeAdapter());
    noteBox = await Hive.openBox<NoteModel>('noteBox');}

}
