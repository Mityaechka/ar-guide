import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.orange,
          border: Border.all(
            color: Colors.orange,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      width: double.infinity,
      child: Stack(
        children: [titleWidget("Главная"), buttonWidget()],
      ),
    );
  }

  Widget titleWidget(String text) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 15),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buttonWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 15),
      child: TextButton(
        child: Icon(Icons.arrow_back),
        style: TextButton.styleFrom(
            minimumSize: Size.zero, // Set this
            padding: EdgeInsets.zero,
            primary: Colors.white // and this
            ),
        onPressed: () {},
      ),
    );
  }
}
