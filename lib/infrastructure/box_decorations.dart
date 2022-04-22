import 'package:flutter/cupertino.dart';

class AppBoxDecorations {
  static BoxDecoration rounded(
      Color borderColor, Color backgroundColor, double radius,
      {double width = 5}) {
    return BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor,width: width),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
