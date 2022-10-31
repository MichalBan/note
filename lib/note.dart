import 'dart:math';

class Note{
  int _id;
  String _content;

  Note(this._id, this._content);

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
}