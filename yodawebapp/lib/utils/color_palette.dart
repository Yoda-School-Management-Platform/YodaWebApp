import 'package:flutter/material.dart';

abstract class ColorPalette {
  static Color _darkGrey = Color.fromRGBO(40, 40, 40, 1);
  static Color _yellow = Color.fromRGBO(251, 209, 128, 1);
  static Color _pinkPurple = Color.fromRGBO(227, 78, 191, 1);

  static Gradient _yellowPurpleBlueGradient = LinearGradient(colors: [
    Color(0xFFF2C139),
    Color(0xFFCE768D),
    Color(0xFF7932CD),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static Gradient get yellowPurpleBlueGradient => _yellowPurpleBlueGradient;

  static Color get darkGrey => _darkGrey;

  static Color get yellow => _yellow;

  static Color get pinkPurple => _pinkPurple;
}
