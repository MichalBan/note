import 'package:flutter/material.dart';
import 'package:note/deadline_colorist.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'settinger.dart';
import 'note_wall.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static of(BuildContext context, {bool root = false}) =>
      context.findAncestorStateOfType<_SettingsPageState>();

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Settinger().getPrimaryColor()),
          backgroundColor: Settinger().getBackgroundColor(),
          title:
              Text("Settings", style: TextStyle(color: Settinger().getPrimaryColor())),
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
                    onRestorePressed(context);
                  },
                  icon: const Icon(Icons.restore)),
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 3,
          children: [
            Center(child: Text("tresholds", style: Settinger().getSettingsFont())),
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3,
              children: [
                Slider(
                  activeColor: Settinger().getPrimaryColor(),
                  value: DeadlineColourist()
                      .getDeadlinePercent(DeadlineTypes.medium)
                      .toDouble(),
                  max: 100,
                  divisions: 100,
                  label: DeadlineColourist()
                      .getDeadlinePercent(DeadlineTypes.medium)
                      .toString(),
                  onChanged: (double value) {
                    setState(() {
                      DeadlineColourist().setDeadlinePercent(
                          DeadlineTypes.medium, value.toInt());
                    });
                  },
                ),
                //Center(child: Text("Color", style: cst.wallFont)),
                Center(
                    child: Container(
                  height: 30,
                  width: 30,
                  color: DeadlineColourist()
                      .getDeadlineColor(DeadlineTypes.medium),
                )),
                Slider(
                  activeColor: Settinger().getPrimaryColor(),
                  value: DeadlineColourist()
                      .getDeadlinePercent(DeadlineTypes.short)
                      .toDouble(),
                  max: 100,
                  divisions: 100,
                  label: DeadlineColourist()
                      .getDeadlinePercent(DeadlineTypes.short)
                      .toString(),
                  onChanged: (double value) {
                    setState(() {
                      DeadlineColourist().setDeadlinePercent(
                          DeadlineTypes.short, value.toInt());
                    });
                  },
                ),
                Center(
                    child: Container(
                  height: 30,
                  width: 30,
                  color:
                      DeadlineColourist().getDeadlineColor(DeadlineTypes.short),
                )),
              ],
            ),
            Center(child: Text("Colors", style: Settinger().getSettingsFont())),
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3,
              children: [
                Center(child: Text("background", style: Settinger().getSettingsFont())),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Pick background color!'),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  pickerColor: Settinger().getBackgroundColor(),
                                  //default color
                                  onColorChanged: (Color color) {
                                    //on color picked
                                    setState(() {
                                      NoteWall.of(context).rebuild();
                                      Settinger().setBackgroundColor(color);
                                    });
                                  },
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('DONE'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); //dismiss the color picker
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.color_lens)),
                Center(child: Text("primary", style: Settinger().getSettingsFont())),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Pick primary color!'),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  pickerColor: Settinger().getPrimaryColor(),
                                  //default color
                                  onColorChanged: (Color color) {
                                    //on color picked
                                    setState(() {
                                      NoteWall.of(context).rebuild();
                                      Settinger().setPrimaryColor(color);
                                    });
                                  },
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('DONE'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); //dismiss the color picker
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.color_lens)),
              ],
            ),
          ],
        ));
  }

  void onHomePressed(BuildContext context) {
    Navigator.pop(context);
  }

  void onRestorePressed(BuildContext context) {
    Settinger().restore();
    DeadlineColourist().restore();
  }
}
