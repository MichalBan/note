import 'package:flutter/material.dart';
import 'note_edit.dart';
import 'note_wall.dart';
import 'constants.dart' as constants;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'note',
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
        body: const Center(child: NoteWall()),
      ),
    );
  }

  void onAddPressed(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NoteEdit()));
  }

  void onSearchPressed() {}

  void onMenuPressed() {}
}
