import 'package:ar_guide/gen/assets.gen.dart';
import 'package:ar_guide/infrastructure/app_colors.dart';
import 'package:ar_guide/infrastructure/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExcursionContainer extends StatelessWidget {
  final String name;
  final String text;
  final String image;
  final bool isSelect;
  final void Function() onSelect;

  ExcursionContainer(
      {Key? key,
      required this.name,
      required this.text,
      required this.image,
      required this.isSelect,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
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
      ),
    );
  }

  Widget title() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, left: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: TextStyles.h1(),
      ),
    );
  }

  Widget body() {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 200),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 5),
          borderRadius: const BorderRadius.all(const Radius.circular(15))),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
              child: Text(
                text,
                style: TextStyles.h2(),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Image.asset(
              image,
              height: 125,
              width: 125,
            ),
          )
        ],
      ),
    );
  }

  Widget dot() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: Icon(
            Icons.circle,
            size: 25,
            color: isSelect ? AppColors.black : AppColors.orange,
          ),
        ),
      ],
    );
  }
}
