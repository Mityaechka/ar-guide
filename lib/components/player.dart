import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Глава 1. Часть 10",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        buttons(),
      ],
    );
  }

  Widget buttons() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
      TextButton(
        child: Icon(Icons.play_arrow,size: 50,color: Colors.orange,),
        style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            primary: Colors.black),
        onPressed: (){},
      ),
      TextButton(
        child: Icon(Icons.play_arrow,size: 50,color: Colors.orange,),
        style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            primary: Colors.black),
        onPressed: (){},
      ),
      TextButton(
        child: Icon(Icons.play_arrow,size: 50,color: Colors.orange,),
        style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            primary: Colors.black),
        onPressed: (){},
      )
    ],);
  }
}
