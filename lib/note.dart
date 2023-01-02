import 'dart:math';

class Note {
  int _id = 0;
  String _content = "";
  DateTime? _deadline;
  DateTime _updateDate = DateTime(0);

  Note(int id, String content) {
    _id = id;
    _content = content;
    _deadline = null;
    _updateDate = DateTime.now();
  }

  Note.dated(int id, String content, DateTime? deadline, DateTime updateDate) {
    _id = id;
    _content = content;
    _deadline = deadline;
    _updateDate = updateDate;
  }

  void setDeadline(DateTime? newDeadline) {
    _deadline = newDeadline;
  }

  DateTime? getDeadline() {
    return _deadline;
  }

  DateTime getUpdateDate() {
    return _updateDate;
  }

  void setId(int newId) {
    _id = newId;
  }

  int getId() {
    return _id;
  }

  void decrementId() {
    --_id;
  }

  void setContent(String newContent) {
    _content = newContent;
  }

  String getContent() {
    return _content;
  }

  String getTitle() {
    int len = min(_content.length, 30);
    return _content.substring(0, len);

    if (_deadline == null) {
    } else {
      return "${_deadline!.day}/${_deadline!.month} ${_content.substring(0, min(_content.length, 10))} ${_updateDate.day}/${_updateDate.month}";
    }
  }

  String getDeadlineText(){
    if(_deadline == null){
      return "";
    }else{
      return "${_deadline!.day}/${_deadline!.month}";
    }
  }

  String getUpdateDateText(){
    return "${_updateDate.day}/${_updateDate.month}";
  }
}
