import 'package:ar_guide/infrastructure/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle h1({Color color = AppColors.black}) {
    return TextStyle(color: color, fontSize: 21, fontWeight: FontWeight.bold);
  }

  static TextStyle h2({Color color = AppColors.black}) {
    return TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold);
  }

  static TextStyle p({Color color = AppColors.black}) {
    return TextStyle(color: color, fontSize: 16);
  }
}
