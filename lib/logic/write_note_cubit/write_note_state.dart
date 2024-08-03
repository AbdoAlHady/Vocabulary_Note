sealed class WriteNoteState {
}

class WriteNoteInitialState extends WriteNoteState {
}

class WriteNoteLoadingState extends WriteNoteState {
}

class WriteNoteSuccessState extends WriteNoteState {
}

class WriteNoteErrorState extends WriteNoteState {
  final String errorMessage;

   WriteNoteErrorState({required this.errorMessage});
}
