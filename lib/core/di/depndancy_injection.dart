import 'package:get_it/get_it.dart';
import 'package:vocabulary_note/data/repos/note_repo.dart';
import 'package:vocabulary_note/logic/write_note_cubit/write_note_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  getIt.registerSingleton<NoteRepo>(NoteRepo());
  getIt.registerFactory<WriteNoteCubit>(()=>WriteNoteCubit(getIt()));
}
