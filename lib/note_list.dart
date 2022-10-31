import 'note.dart';

class NoteList {
  NoteList._internal();

  static final NoteList _instance = NoteList._internal();
  final List<Note> _itsNotes = <Note>[];

  factory NoteList() {
    return _instance;
  }

  void createPlaceholders() {
    for (int i = 0; i < 10; ++i) {
      _itsNotes.add(Note(i, "placeholder"));
    }
  }

  List<Note> getNotes(){
    return _itsNotes;
  }

  void addNote(){
    _itsNotes.add(Note(_itsNotes.length, ""));
  }

  int getLastId(){
    return _itsNotes.length - 1;
  }
}
