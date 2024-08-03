import '../../data/models/note_model.dart';

abstract class ReadNoteState {
  
}


class ReadNoteInitial extends ReadNoteState {
  
}

class ReadNoteLoadingState extends ReadNoteState {
  
}

class ReadNoteSuccessState extends ReadNoteState {
  final List<NoteModel> noteList;

  ReadNoteSuccessState({required this.noteList});
  
}

class ReadNoteErrorState extends ReadNoteState {
  final String message;

  ReadNoteErrorState({required this.message});
  
}