import 'package:flutter/material.dart';

class Settinger {
  Settinger._internal();

  Color _colorText = Colors.black;
  Color _colorBackground = Colors.green;
  Color _colorPrimary = Colors.yellow;
  double _fontBaseSize = 24;

  static final Settinger _instance = Settinger._internal();

  factory Settinger() {
    return _instance;
  }

  Color getPrimaryColor(){
    return _colorPrimary;
  }

  void setPrimaryColor(Color newColor){
    _colorPrimary = newColor;
  }

  Color getBackgroundEditColor(){
    final hsl = HSLColor.fromColor(_colorBackground);
    final hslLight = hsl.withLightness((hsl.lightness + 0.2).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  void setBackgroundColor(Color newColor){
    _colorBackground = newColor;
  }

  Color getBackgroundColor(){
    return _colorBackground;
  }

  TextStyle getWallFont(){
    return TextStyle(fontSize: _fontBaseSize, color: _colorText);
  }

  TextStyle getSettingsFont(){
    return TextStyle(fontSize: _fontBaseSize, color: _colorPrimary);
  }

  void restore() {
    _colorBackground = Colors.green;
    _colorPrimary = Colors.yellow;
  }
}
