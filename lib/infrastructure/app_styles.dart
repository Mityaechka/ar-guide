import 'package:flutter/material.dart';

class AppStyles {
  static ButtonStyle zero(Color color) {
    return TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero, primary: color);
  }
}
