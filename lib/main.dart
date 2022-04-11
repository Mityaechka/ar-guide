import 'package:ar_guide/components/header.dart';
import 'package:ar_guide/components/player_hotbar.dart';
import 'package:flutter/material.dart';

import 'components/bottom_bar.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
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
          Header(),
          Expanded(child: body(context)),
          PlayerHotbar(),
          BottomBar()
        ],
      )),
    );
  }

  Widget item(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              Icons.circle,
              size: 25,
            ),
          ],
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "1st object",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(minHeight: 100),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  children: [
                    Expanded(
                      flex:6,
                      child: Container(
                        padding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
                        child: Text(
                          "Игровое поле для игры в го, выполненное в виде толстого цельнодеревянного столика на невысоких ножках.",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Icon(
                        Icons.margin,
                        size: 150,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget body(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Some Text",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          item(context)
        ],
      ),
    );
  }
}
