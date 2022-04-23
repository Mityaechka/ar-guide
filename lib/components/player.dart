import 'package:ar_guide/components/header.dart';
import 'package:ar_guide/components/position_seek.dart';
import 'package:ar_guide/extensions/player.dart';
import 'package:ar_guide/state_managment/store.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
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
      return FractionallySizedBox(
        heightFactor: 0.96,
        child: Column(
          children: [
            Header(
              title: "",
              icon: Icons.close,
              onCloseClick: onCloseClick,
            ),
            Expanded (
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Text("Отправляемся в путешествие!",
                            style: TextStyles.h1())),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Небольшая информация о месте Небольшая информация о месте Небольшая информация о месте ",
                        style: TextStyles.p(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      child: Image.asset(store.selectedExcursion!.image,
                          width: 400, height: 400),
                    ),
                    Container(
                        child: Text(
                          store.selectedPart!.name,
                          style: TextStyles.h2(),
                          textAlign: TextAlign.left,
                        )),
                    buttons(store),
                    store.player.builderRealtimePlayingInfos(
                        builder: (context, RealtimePlayingInfos? infos) {
                          return PositionSeek(
                            currentPosition: infos!.currentPosition,
                            duration: infos.duration,
                            seekTo: (to) {
                              store.player.seek(to);
                            },
                          );
                        }),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: AppBoxDecorations.rounded(
                          AppColors.yellow, AppColors.yellow, 10),
                      child: Column(
                        children: [
                          Text("Транскрипция", style: TextStyles.h1()),
                          Text(store.selectedPart!.transcription,
                              style: TextStyles.h2()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buttons(Store store) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleButton(
          child: AppIcons.white(Icons.skip_previous, 40),
          color: AppColors.yellow,
        ),
        CircleButton(
          child: PlayerBuilder.isPlaying(
              player: store.player,
              builder: (context, value) {
                return AppIcons.white(
                    value ? Icons.pause : Icons.play_arrow, 50);
              }),
          onPressed: store.changePlayState,
        ),
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
  final void Function()? onPressed;

  const CircleButton({
    Key? key,
    this.color = AppColors.orange,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.rounded(color, color, 50),
      child: TextButton(
        child: child,
        style: AppStyles.zero(AppColors.orange),
        onPressed: onPressed,
      ),
    );
  }
}
