import 'package:flutter/cupertino.dart';

class AppBoxDecorations {
  static BoxDecoration rounded(Color color, double radius) {
    return BoxDecoration(
        color: color,
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
