import 'package:flutter/material.dart';
import 'constants.dart' as cst;
import 'note.dart';
import 'note_edit.dart';

class WallEntry extends StatelessWidget implements PreferredSizeWidget {
  final Note _itsNote;

  const WallEntry(this._itsNote, {super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(context);
      },
      child: Container(
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
        child: Text(_itsNote.getTitle(),
            textAlign: TextAlign.center, style: cst.wallFont),
      ),
    );
  }

  void onPressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NoteEdit(_itsNote.getId()),
    ));
  }

  Color getNoteColor(){
    if(_itsNote.getDeadline() == null){
      return cst.colorDeadlineTimeless;
    }
    if(_itsNote.getDeadline()!.compareTo(DateTime.now()) < 0){
      return cst.colorDeadlinePast;
    }

    int days = daysBetween(DateTime.now(), _itsNote.getDeadline()!);
    if(days > 5){
      return cst.colorDeadlineFar;
    }
    if(days > 1){
      return cst.colorDeadlineMedium;
    }
    return cst.colorDeadlineShort;
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

}
