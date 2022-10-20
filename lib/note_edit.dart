import 'package:flutter/material.dart';
import 'constants.dart' as constants;

class NoteEdit extends StatefulWidget {
  const NoteEdit({Key? key}) : super(key: key);

  @override
  State<NoteEdit> createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  String title = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: constants.textColor
        ),
        backgroundColor: constants.navbarColor,
        title: Text(
          title,
          style: const TextStyle(color: constants.textColor),
        ),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  onHomePressed(context);
                },
                icon: const Icon(Icons.home)),
          ),
          IconButton(
              onPressed: onDeletePressed, icon: const Icon(Icons.delete)),
        ],
      ),
      body: Center(child: Text(content)),
    );
  }

  void onHomePressed(BuildContext context) {
    Navigator.pop(context);
  }

  void onDeletePressed() {}
}
