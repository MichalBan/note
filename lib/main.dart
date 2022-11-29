import 'package:flutter/material.dart';
import 'note_wall.dart';
import 'note_list.dart';
import 'note.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: NoteList().loadNotes(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {  // AsyncSnapshot<Your object type>
        return NoteWall();  // snapshot.data  :- get your object which is pass from your downloadData() function
        }
    );
  }
}
