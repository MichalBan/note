import 'package:flutter/material.dart';
import 'constants.dart' as cst;
import 'note_list.dart';
import 'note_wall.dart';

class NoteEdit extends StatefulWidget {
  final int _id;

  const NoteEdit(this._id, {super.key});

  @override
  State<NoteEdit> createState() => _NoteEditState();

}

class _NoteEditState extends State<NoteEdit> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: cst.textColor),
        backgroundColor: cst.navbarColor,
        title: Text(
          NoteList().getNotes()[widget._id].getTitle(),
          style: const TextStyle(color: cst.textColor),
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
      body: TextFormField(
          onChanged: (text){onTextChanged(text);},
          maxLines: null,
          decoration: const InputDecoration(
            filled: true,
            fillColor: cst.backgroundColor,
          ),
          initialValue: NoteList().getNotes()[widget._id].getContent(),
          style: cst.wallFont),
    );
  }

  void onTextChanged(String text){
    NoteList().getNotes()[widget._id].setContent(text);
  }

  void onHomePressed(BuildContext context) {
    NoteWall.of(context).updateNoteEntries();
    Navigator.pop(context);
  }

  void onDeletePressed() {}
}
