import 'package:ar_guide/components/header.dart';
import 'package:ar_guide/components/item.dart';
import 'package:ar_guide/components/player.dart';
import 'package:ar_guide/components/player_hotbar.dart';
import 'package:flutter/material.dart';

import 'components/bottom_bar.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          body: Column(
        children: [
          Player()
          // const Header(),
          // Expanded(child: body()),
          // const PlayerHotbar(),
          // const BottomBar()
        ],
      )),
    );
  }

  Widget body() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const Text(
              "Some Text",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Item(name: "1",),
          Item(name: "1"),
           Item(name: "1"),
        ],
      ),
    );
  }
}
