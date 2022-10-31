import 'package:flutter/material.dart';
import 'note_list.dart';
import 'wall_entry.dart';
import 'constants.dart' as constants;
import 'note_edit.dart';

class NoteWall extends StatefulWidget {
  static of(BuildContext context, {bool root = false}) =>
      context.findAncestorStateOfType<NoteWallState>();

  @override
  State<NoteWall> createState() => NoteWallState();
}

class NoteWallState extends State<NoteWall> {
  final List<WallEntry> _entryList = <WallEntry>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'note',
      theme: ThemeData(scaffoldBackgroundColor: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: constants.textColor, //change your color here
          ),
          backgroundColor: constants.navbarColor,
          title: const Text(
            "note",
            style: TextStyle(color: constants.textColor),
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
            IconButton(
                onPressed: onSearchPressed, icon: const Icon(Icons.search)),
            IconButton(onPressed: onMenuPressed, icon: const Icon(Icons.menu)),
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

  void updateNoteEntries() {
    setState(() {
      _entryList.clear();
      NoteList().getNotes().forEach((note) {
        _entryList.add(WallEntry(note));
      });
    });
  }

  void onAddPressed(BuildContext context) {
    NoteList().addNote();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NoteEdit(NoteList().getLastId()),
      ),
    );
  }

  void onSearchPressed() {}

  void onMenuPressed() {}
}
