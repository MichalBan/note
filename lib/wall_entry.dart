import 'package:flutter/material.dart';
import 'settinger.dart';
import 'deadline_colorist.dart';
import 'note.dart';
import 'note_edit.dart';

class WallEntry extends StatelessWidget {
  final Note _itsNote;

  const WallEntry(this._itsNote, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(context);
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(color: Color(0xFFDFDFDF)),
            left: BorderSide(color: Color(0xFFDFDFDF)),
            right: BorderSide(color: Color(0xFF7F7F7F)),
            bottom: BorderSide(color: Color(0xFF7F7F7F)),
          ),
          color: getNoteColor(),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Text(_itsNote.getDeadlineText(),
                    textAlign: TextAlign.center,
                    style: Settinger().getWallFont()),
              ),
            ),
            Expanded(
              flex: 6,
              child: Align(
                alignment: Alignment.center,
                child: Text(_itsNote.getTitle(),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: Settinger().getWallFont()),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Text(_itsNote.getUpdateDateText(),
                    textAlign: TextAlign.center,
                    style: Settinger().getWallFont()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NoteEdit(_itsNote.getId()),
    ));
  }

  Color getNoteColor() {
    int percent = calculateDeadlinePercent();
    return DeadlineColourist().getProperColor(percent);
  }

  int calculateDeadlinePercent() {
    if (_itsNote.getDeadline() == null) {
      return 101;
    }

    DateTime to = _itsNote.getDeadline()!; //rough math, but good enough
    DateTime from = _itsNote.getUpdateDate();
    int left = (to.difference(DateTime.now()).inMinutes).round();
    if (left < 0) {
      return -1;
    }
    int extent = (to.difference(from).inMinutes).round();

    return (100 * left / extent).round();
  }
}
