sealed class ReadNoteState {
  const ReadNoteState();
}

class ReadNoteInitialState extends ReadNoteState {
  const ReadNoteInitialState();
}

class ReadNoteLoadingState extends ReadNoteState {
  const ReadNoteLoadingState();
}

class ReadNoteSuccessState extends ReadNoteState {
  const ReadNoteSuccessState();
}

class ReadNoteErrorState extends ReadNoteState {
  final String errorMessage;

  const ReadNoteErrorState(this.errorMessage);
}
