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
      if(list[1] == "null"){
        _itsNotes.add(Note(noteId, list[0]));
      }else{
        _itsNotes.add(Note.dated(noteId, list[0], DateTime.parse(list[1])));
      }
    }
  }

  Future<void> saveNote(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(id.toString(), [_itsNotes[id].getContent(), _itsNotes[id].getDeadline().toString()]);
  }

  Future<void> saveNotes() async {
    sortNotesByDeadline();
    for(var note in _itsNotes){
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(note.getId().toString(), [note.getContent(), note.getDeadline().toString()]);
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
