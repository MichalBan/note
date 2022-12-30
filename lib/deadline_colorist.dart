import 'package:flutter/material.dart';

enum DeadlineTypes { timeless, far, medium, short, past }

extension Math on DeadlineTypes {
  DeadlineTypes operator +(int shift) {
    return DeadlineTypes.values[index + shift];
  }

  DeadlineTypes operator -(int shift) {
    return DeadlineTypes.values[index - shift];
  }
}

class DeadlineColourist {
  DeadlineColourist._internal();

  final Map<DeadlineTypes, Color> _deadlineColors = {
    DeadlineTypes.timeless: Colors.lightBlue.shade400,
    DeadlineTypes.far: Colors.green.shade400,
    DeadlineTypes.medium: Colors.yellow.shade400,
    DeadlineTypes.short: Colors.red.shade400,
    DeadlineTypes.past: Colors.blueGrey.shade400,
  };

  final Map<DeadlineTypes, int> _deadlinePercents = {
    DeadlineTypes.timeless: 101,
    DeadlineTypes.far: 100,
    DeadlineTypes.medium: 50,
    DeadlineTypes.short: 25,
    DeadlineTypes.past: -1,
  };

  static final DeadlineColourist _instance = DeadlineColourist._internal();

  factory DeadlineColourist() {
    return _instance;
  }

  Color getDeadlineColor(DeadlineTypes type){
    return _deadlineColors[type]!;
  }

  Color getProperColor(int percent) {
    if(percent < 0){
      return _deadlineColors[DeadlineTypes.past]!;
    }

    for (DeadlineTypes type in DeadlineTypes.values) {
      if (percent <= _deadlinePercents[type]! && percent > _deadlinePercents[type+1]!) {
        return _deadlineColors[type]!;
      }
    }
    // should never really get here
    return _deadlineColors[DeadlineTypes.timeless]!;
  }

  int getDeadlinePercent(DeadlineTypes type){
    return _deadlinePercents[type]!;
  }

  void setDeadlinePercent(DeadlineTypes type, int percent){
    if(percent < _deadlinePercents[type + 1]!){
      percent = _deadlinePercents[type + 1]!;
    }else if(percent > _deadlinePercents[type - 1]!){
      percent = _deadlinePercents[type - 1]!;
    }
    _deadlinePercents[type] = percent;
  }

  void restore() {
    _deadlinePercents[DeadlineTypes.medium] = 50;
    _deadlinePercents[DeadlineTypes.short] = 25;
  }
}
