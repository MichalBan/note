import 'package:flutter/material.dart';
import 'note_list.dart';
import 'wall_entry.dart';
import 'settinger.dart';
import 'note_edit.dart';
import 'settings_page.dart';

class NoteWall extends StatefulWidget {
  const NoteWall({super.key});

  static of(BuildContext context, {bool root = false}) =>
      context.findAncestorStateOfType<NoteWallState>();

  @override
  State<NoteWall> createState() => NoteWallState();
}

class NoteWallState extends State<NoteWall> {
  final List<WallEntry> _entryList = <WallEntry>[];

  @override
  Widget build(BuildContext context) {
    updateNoteEntries();
    return MaterialApp(
      title: 'note',
      theme: ThemeData(scaffoldBackgroundColor: Settinger().getBackgroundColor()),
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Settinger().getPrimaryColor(),
          ),
          backgroundColor: Settinger().getBackgroundColor(),
          title: Text(
            "note",
            style: TextStyle(color: Settinger().getPrimaryColor()),
          ),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    onAddPressed(context);
                  },
                  icon: const Icon(Icons.add)),
            ),
            //IconButton(onPressed: onMenuPressed, icon: const Icon(Icons.menu)),
            Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    onSettingsPressed(context);
                  },
                  icon: const Icon(Icons.settings)),
            ),
            IconButton(
                onPressed: onSearchPressed, icon: const Icon(Icons.search)),
          ],
        ),
        body: Center(
          child: Scrollbar(
            child: ListView.builder(
              itemCount: _entryList.length,
              itemBuilder: (context, i) {
                return _entryList[i];
              },
            ),
          ),
        ),
      ),
    );
  }

  void rebuild(){
    setState(() {

    });
  }

  void deleteNote(int id) {
    NoteList().deleteNote(id);
    setState(() {
      _entryList.removeAt(id);
    });
  }

  void updateNote(int id){
    setState(() {
      _entryList[id] = WallEntry(NoteList().getNotes()[id]);
    });
  }

  void onAddPressed(BuildContext context) {
    NoteList().addNote();
    _entryList.add(WallEntry(NoteList().getLastNote()));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NoteEdit(NoteList().getLastId()),
      ),
    );
  }

  void onSettingsPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsPage(),
      ),
    );
  }

  void onSearchPressed() {}

  void onMenuPressed() {}

  void updateNoteEntries() {
    NoteList().sortNotesByDeadline();
    _entryList.clear();
    NoteList().getNotes().forEach((note) {
      _entryList.add(WallEntry(note));
    });
  }
}
