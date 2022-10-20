import 'package:flutter/material.dart';

import 'note_entry.dart';

class NoteWall extends StatefulWidget {
  const NoteWall({Key? key}) : super(key: key);

  @override
  State<NoteWall> createState() => _NoteWallState();
}

class _NoteWallState extends State<NoteWall> {
  List<WallEntry> noteList = <WallEntry>[];
  final _wallFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    createPlaceholderNotes();
    return Scrollbar(
      child: ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, i) {
          return noteList[i];
        },
      ),
    );
  }

  void createPlaceholderNotes() {
    for (int i = 0; i < 50; ++i) {
      noteList.add(WallEntry());
    }
  }
}
