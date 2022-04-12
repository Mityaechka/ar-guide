import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  String name;

  Item({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dot(),
          Expanded(
            child: Column(
              children: [
                title(),
                body(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget title(){
    return Container(
      padding: const EdgeInsets.only(bottom: 20,left: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }

  Widget body(){
    return Container(
      margin: const EdgeInsets.only(right: 20,left: 20),
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 5),
          borderRadius: const BorderRadius.all(const Radius.circular(15))),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
              child: const Text(
                "Игровое поле для игры в го, выполненное в виде толстого цельнодеревянного столика на невысоких ножках.",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
          const Expanded(
            flex: 4,
            child: Icon(
              Icons.margin,
              size: 150,
            ),
          )
        ],
      ),
    );
  }

  Widget dot(){
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: const Icon(
            Icons.circle,
            size: 25,
          ),
        ),
      ],
    );
  }
}
