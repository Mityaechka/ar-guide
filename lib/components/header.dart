import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../infrastructure/app_colors.dart';

class Header extends StatelessWidget {
  final String title;
  final bool showButton;
  final IconData icon;
  final Color color;

  const Header(
      {Key? key,
      required this.title,
      this.showButton = true,
      this.icon = Icons.arrow_back,
      this.color = AppColors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      width: double.infinity,
      child: Stack(
        children: [titleWidget(title), if (showButton) buttonWidget()],
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
        child: Icon(icon),
        style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            primary: Colors.white),
        onPressed: () {},
      ),
    );
  }
}
