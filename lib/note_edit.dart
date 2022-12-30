import 'package:flutter/material.dart';
import 'settinger.dart';
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
        iconTheme: IconThemeData(color: Settinger().getPrimaryColor()),
        backgroundColor: Settinger().getBackgroundColor(),
        title: Text(
          NoteList().getNotes()[widget._id].getTitle(),
          style: TextStyle(color: Settinger().getPrimaryColor()),
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
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  onDeletePressed(context);
                },
                icon: const Icon(Icons.delete)),
          ),
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  onDatePressed(context);
                },
                icon: const Icon(Icons.date_range)),
          ),
        ],
      ),
      body: TextFormField(
          onChanged: (text) {
            onTextChanged(text);
          },
          maxLines: null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Settinger().getBackgroundEditColor(),
          ),
          initialValue: NoteList().getNotes()[widget._id].getContent(),
          style: Settinger().getWallFont()),
    );
  }

  void onTextChanged(String text) {
    NoteList().getNotes()[widget._id].setContent(text);
  }

  void onHomePressed(BuildContext context) {
    NoteList().saveNotes();
    NoteWall.of(context).updateNote(widget._id);
    Navigator.pop(context);
  }

  void onDeletePressed(BuildContext context) {
    NoteList().forgetNote(widget._id);
    NoteWall.of(context).deleteNote(widget._id);
    Navigator.pop(context);
  }

  Future<void> onDatePressed(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
        helpText: "Pick Deadline",
        cancelText: "No Deadline");
      setState(() {
        NoteList().getNotes()[widget._id].setDeadline(picked);
      });
  }
}
