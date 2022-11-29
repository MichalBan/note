import 'dart:math';

class Note{
  int _id = 0;
  String _content =  "";
  DateTime? _deadline;

  Note(int id, String content){
    _id = id;
    _content = content;
    _deadline = null;
  }

  Note.dated(int id, String content, DateTime deadline){
    _id = id;
    _content = content;
    _deadline = deadline;
  }

  void setDeadline(DateTime? newDeadline){
    _deadline = newDeadline;
  }

  DateTime? getDeadline(){
    return _deadline;
  }

  void setId(int newId){
    _id = newId;
  }

  int getId(){
    return _id;
  }

  void setContent(String newContent){
    _content = newContent;
  }

  String getContent(){
    return _content;
  }

  String getTitle(){
    return _content.substring(0, min(_content.length, 20));
  }

  void decrementIndex() {
    --_id;
  }
}