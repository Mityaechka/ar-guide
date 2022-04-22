import 'package:ar_guide/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // button(Assets.images.iconMenu.path, () {}),
          // button(Assets.images.iconQr.path, () {}),
          // button(Assets.images.iconSettings.path, () {}),
          button(Assets.images.goban.path, () {}),
          button(Assets.images.goban.path, () {}),
          button(Assets.images.goban.path, () {}),
        ],
      ),
    );
  }

  static Widget button(String image, VoidCallback? onPressed) {
    return TextButton(
      child: Image.asset(
        image,
        height: 50,
        width: 50,
      ),
      style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          primary: Colors.black),
      onPressed: onPressed,
    );
  }
}
