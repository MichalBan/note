import 'package:shared_preferences/shared_preferences.dart';

import 'note.dart';

class NoteList {
  NoteList._internal();

  static final NoteList _instance = NoteList._internal();
  final List<Note> _itsNotes = <Note>[];

  factory NoteList() {
    return _instance;
  }

  List<Note> getNotes() {
    return _itsNotes;
  }

  void addNote() {
    _itsNotes.add(Note(_itsNotes.length, ""));
  }

  int getLastId() {
    return _itsNotes.length - 1;
  }

  void deleteNote(int id) {
    _itsNotes.removeAt(id);
    for (int i = id; i < _itsNotes.length; ++i) {
      _itsNotes[i].decrementIndex();
    }
  }

  Note getLastNote() {
    return _itsNotes.last;
  }

  Future<void> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();

    while (true) {
      int noteId = _itsNotes.length;
      var list = prefs.getStringList(noteId.toString());
      if (list == null) {
        break;
      }

      DateTime? deadline;
      if(list[1] == "null"){
        deadline = null;
      }else{
        deadline = DateTime.parse(list[1]);
      }
      DateTime updateDate = DateTime.parse(list[2]);
      _itsNotes.add(Note.dated(noteId, list[0], deadline, updateDate));
    }
  }

  Future<void> saveNotes() async {
    sortNotesByDeadline();
    for(var note in _itsNotes){
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(note.getId().toString(), [note.getContent(), note.getDeadline().toString(), note.getUpdateDate().toString()]);
    }
  }

  Future<void> forgetNote(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(id.toString());
  }

  void sortNotesByDeadline(){
    _itsNotes.sort((a, b){
      if(a.getDeadline() == null){
        return 1;
      }
      if(b.getDeadline() == null){
        return -1;
      }
      return a.getDeadline()!.compareTo(b.getDeadline()!);
    });

    fixIndexes();
  }

  void fixIndexes() {
    int index = 0;
    for(var note in _itsNotes){
      note.setId(index);
      ++index;
    }
  }
}
