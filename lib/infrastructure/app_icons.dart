import 'package:ar_guide/infrastructure/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AppIcons {
  static Icon orange(IconData data, double size) {
    return Icon(
      data,
      size: size,
      color: AppColors.orange,
    );
  }

  static Icon yellow(IconData data, double size) {
    return Icon(
      data,
      size: size,
      color: AppColors.yellow,
    );
  }

  static Icon white(IconData data, double size) {
    return Icon(
      data,
      size: size,
      color: AppColors.white,
    );
  }

  static Icon black(IconData data, double size) {
    return Icon(
      data,
      size: size,
      color: AppColors.black,
    );
  }
}
