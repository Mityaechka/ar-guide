import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          button(
              Icon(
                Icons.arrow_back,
                size: 30,
              ),
              () {}),
          button(
              Icon(
                Icons.arrow_back,
                size: 30,
              ),
              () {}),
          button(
              Icon(
                Icons.arrow_back,
                size: 30,
              ),
              () {}),
        ],
      ),
    );
  }

  static Widget button(Icon icon, VoidCallback? onPressed) {
    return TextButton(
      child: icon,
      style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          primary: Colors.black),
      onPressed: onPressed,
    );
  }
}
