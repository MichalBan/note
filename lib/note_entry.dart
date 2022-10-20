import 'package:flutter/material.dart';
import 'constants.dart' as constants;

class WallEntry extends StatefulWidget implements PreferredSizeWidget {
  const WallEntry({Key? key}) : super(key: key);

  @override
  State<WallEntry> createState() => _WallEntryState();

  @override
  Size get preferredSize => const Size.fromHeight(25.0);
}

class _WallEntryState extends State<WallEntry> {
  final _wallFont = const TextStyle(fontSize: 18);
  String content = "big in japan";

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
        color: constants.backgroundColor,
      ),
      child: Text(
          content,
          textAlign: TextAlign.center,
          style: _wallFont
      ),
    );
  }
}
