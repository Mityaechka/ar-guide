import 'package:ar_guide/components/header.dart';
import 'package:ar_guide/components/item.dart';
import 'package:ar_guide/components/items.dart';
import 'package:ar_guide/components/player.dart';
import 'package:ar_guide/components/player_hotbar.dart';
import 'package:ar_guide/gen/assets.gen.dart';
import 'package:ar_guide/models/item_model.dart';
import 'package:ar_guide/state_managment/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../infrastructure/app_colors.dart';
import '../infrastructure/app_icons.dart';
import '../infrastructure/app_styles.dart';
import '../infrastructure/box_decorations.dart';
import '../infrastructure/text_styles.dart';

class Player extends StatelessWidget {
  final void Function() onCloseClick;

  const Player({Key? key, required this.onCloseClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(builder: (context, store, child) {
      return Column(
        children: [
          Header(
            title: "",
            icon: Icons.close,
            onCloseClick: onCloseClick,
          ),
          Container(
              margin: EdgeInsets.only(top: 50),
              child:
                  Text("Отправляемся в путешествие!", style: TextStyles.h1())),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Небольшая информация о месте Небольшая информация о месте Небольшая информация о месте ",
              style: TextStyles.p(),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child:
                Image.asset(store.selectedItem.image, width: 400, height: 400),
          ),
          Container(
              child: Text(
            "Глава 1. Часть 10",
            style: TextStyles.h2(),
            textAlign: TextAlign.left,
          )),
          buttons(),
          //Spacer(),
          Container(
            padding: EdgeInsets.all(15),
            decoration: AppBoxDecorations.rounded(AppColors.yellow, 10),
            child: Column(
              children: [
                Text("Транскрипция", style: TextStyles.h1()),
                Text(
                    "Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио Весь текст из аудио ",
                    style: TextStyles.p()),
              ],
            ),
          )
        ],
      );
    });
  }

  Widget buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleButton(
          child: AppIcons.white(Icons.skip_previous, 40),
          color: AppColors.yellow,
        ),
        CircleButton(child: AppIcons.white(Icons.play_arrow, 50)),
        CircleButton(
            child: AppIcons.white(Icons.skip_next, 40),
            color: AppColors.yellow),
      ],
    );
  }
}

class CircleButton extends StatelessWidget {
  final Widget child;
  final Color color;

  const CircleButton({
    Key? key,
    this.color = AppColors.orange,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.rounded(color, 50),
      child: TextButton(
        child: child,
        style: AppStyles.zero(AppColors.orange),
        onPressed: () {},
      ),
    );
  }
}
