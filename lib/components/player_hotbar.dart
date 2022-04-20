import 'package:ar_guide/components/player.dart';
import 'package:ar_guide/infrastructure/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../infrastructure/app_colors.dart';

class PlayerHotbar extends StatelessWidget {
  const PlayerHotbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return FractionallySizedBox(
                heightFactor: 1,
                child: Player(
                  onCloseClick: () => Navigator.pop(context),
                ));
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 5,left: 5),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
            color: AppColors.yellow,
            border: Border.all(
              color: AppColors.yellow,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Глава 1. Часть 10",
                style: TextStyles.h2(),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: [
                  button(
                      const Icon(
                        Icons.skip_previous,
                        size: 40,
                        color: AppColors.red,
                      ),
                      () {}),
                  button(
                      const Icon(
                        Icons.play_arrow,
                        size: 40,
                        color: AppColors.red,
                      ),
                      () {}),
                  button(
                      const Icon(
                        Icons.skip_next,
                        size: 40,
                        color: AppColors.red,
                      ),
                      () {})
                ],
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.bottomCenter,
                child: const LinearProgressIndicator(
                  color: AppColors.red,
                  minHeight: 2,
                  value: 10,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
            )
          ],
        ),
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
