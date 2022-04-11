import 'package:ar_guide/components/header.dart';
import 'package:flutter/material.dart';

import 'components/bottom_bar.dart';

void main() {
  runApp(const MyApp());
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
          new Expanded(
            child:
                new Text('Datetime', style: new TextStyle(color: Colors.grey)),
          ),
          BottomBar()
        ],
      )),
    );
  }
}
