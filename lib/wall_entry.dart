import 'package:flutter/material.dart';
import 'constants.dart' as cst;
import 'note.dart';

class WallEntry extends StatelessWidget implements PreferredSizeWidget {
  final Note _itsNote;

  const WallEntry(this._itsNote, {super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFDFDFDF)),
          left: BorderSide(color: Color(0xFFDFDFDF)),
          right: BorderSide(color: Color(0xFF7F7F7F)),
          bottom: BorderSide(color: Color(0xFF7F7F7F)),
        ),
        color: cst.backgroundColor,
      ),
      child: Text(
          _itsNote.getTitle(),
          textAlign: TextAlign.center,
          style: cst.wallFont
      ),
    );
  }
}

