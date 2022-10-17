import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evil Incarnate',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('note'),
          actions: [IconButton(onPressed: onPressed, icon: const Icon(Icons.menu))],
        ),
        body: const Center(child: RandomWords()),
      ),
    );
  }

  void onPressed()
  {

  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <String>[];

  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(createRandomWords());
        }
        return Text(
          _suggestions[index],
          style: _biggerFont,
        );
      },
    );
  }

  List<String> createRandomWords() {
    var randomWords = <String>[];
    for (var i = 0; i < 10; ++i) {
      randomWords.add(all[Random().nextInt(all.length)]);
    }
    return randomWords;
  }
}
