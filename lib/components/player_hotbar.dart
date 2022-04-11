import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerHotbar extends StatelessWidget {
  const PlayerHotbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10,top: 10),
      decoration: BoxDecoration(
          color: Colors.orange,
          border: Border.all(
            color: Colors.orange,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Глава 1. Часть 10",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Wrap(
              children: [
                button(
                    Icon(
                      Icons.skip_previous,
                      size: 40,
                    ),
                    () {}),
                button(
                    Icon(
                      Icons.play_arrow,
                      size: 40,
                    ),
                    () {}),
                button(
                    Icon(
                      Icons.skip_next,
                      size: 40,
                    ),
                    () {})
              ],
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(
                minHeight: 2,
                value: 10,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget button(Icon icon, VoidCallback? onPressed) {
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
