import 'package:flutter/material.dart';
import 'note_wall.dart';
import 'note_list.dart';

void main() {
  NoteList().createPlaceholders();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NoteWall();
  }
}
