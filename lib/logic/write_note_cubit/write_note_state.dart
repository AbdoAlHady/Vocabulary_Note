sealed class WriteNoteState {
  const WriteNoteState();
}

class WriteNoteInitialState extends WriteNoteState {
  const WriteNoteInitialState();
}

class WriteNoteLoadingState extends WriteNoteState {
  const WriteNoteLoadingState();
}

class WriteNoteSuccessState extends WriteNoteState {
  const WriteNoteSuccessState();
}

class WriteNoteErrorState extends WriteNoteState {
  final String errorMessage;

  const WriteNoteErrorState(this.errorMessage);
}
