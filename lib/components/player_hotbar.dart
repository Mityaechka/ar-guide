import 'package:ar_guide/components/player.dart';
import 'package:ar_guide/infrastructure/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../infrastructure/app_colors.dart';
import 'package:provider/provider.dart';

import '../state_managment/store.dart';

class PlayerHotbar extends StatelessWidget {
  const PlayerHotbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(builder: (context, store, child) {
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
          margin: EdgeInsets.only(right: 5, left: 5),
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
                child: Text(store.selectedExcursion!.name + ". " + store.selectedPart!.name),
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
                        Icon(
                          store.isAudioPlaying ? Icons.pause : Icons.play_arrow,
                          size: 40,
                          color: AppColors.red,
                        ),
                        store.changePlayState),
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
                  child: store.buildTotalPlayed((value) => LinearProgressIndicator(
                    color: AppColors.red,
                    minHeight: 2,
                    value: value ,
                    semanticsLabel: 'Linear progress indicator',
                  )) ,
                ),
              )
            ],
          ),
        ),
      );
    });
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
