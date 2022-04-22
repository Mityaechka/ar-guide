import 'package:ar_guide/models/excursion_model.dart';
import 'package:ar_guide/models/excursion_part.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

import '../gen/assets.gen.dart';

class Store extends ChangeNotifier {
  static List<ExcursionPart> exampleParts = [
    ExcursionPart("Часть 1", "Часть 1. Это пример краткого описания.",
        "Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция."),
    ExcursionPart(
        "Часть 2",
        "Часть 2. Это пример краткого описания.Это пример краткого описания.Это пример краткого описания.Это пример краткого описания.",
        "Транскрипция.Транскрипция.Транскрипция.Транскрипция."),
    ExcursionPart(
        "Часть 3",
        "Часть 3. Это пример краткого описания.Это пример краткого описания.",
        "Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция."),
    ExcursionPart(
        "Часть 4",
        "Часть 4. Это пример краткого описания.Это пример краткого описания.Это пример краткого описания.",
        "Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция.Транскрипция."),
  ];
  static List<ExcursionModel> excursions = [
    ExcursionModel(
        "Гобан",
        "Игровое поле для игры в го, выполненное в виде толстого цельнодеревянного столика на невысоких ножках.",
        Assets.images.goban.path,
        exampleParts),
    ExcursionModel(
        "Сакура",
        "Японские вишни не плодоносят или дают мелкий, несъедобный плод.",
        Assets.images.sakura.path,
        exampleParts),
    ExcursionModel(
        "Тясицу",
        "Тясицу — чайный домик, атрибут японской чайной церемонии.",
        Assets.images.teaHouse.path,
        exampleParts)
  ];
  ExcursionModel? selectedExcursion;
  ExcursionPart? selectedPart;

  AssetsAudioPlayer player = AssetsAudioPlayer.newPlayer();

  Store(){

  }

  bool get isAudioPlaying {
    return player.isPlaying.value;
  }

  int get compelete {
    if (!player.currentPosition.hasValue || !player.current.hasValue) return 0;

    return player.currentPosition.value.inSeconds;
  }

  PlayerBuilder buildTotalPlayed(Widget Function(double) onBuild) {
    return player.builderCurrentPosition(builder: (context, duration) {
      if (!player.current.hasValue) {
        return onBuild(0);
      }

      final playing = player.current.value!.audio.duration;
      var value = ((duration.inSeconds / playing.inSeconds));
      debugPrint(value.toString());
      return onBuild(value);
    });
  }

  void setSelectedExcursion(ExcursionModel excursion) {
    selectedExcursion = excursion;
    notifyListeners();
  }

  void setSelectedPart(ExcursionPart part) {
    selectedPart = part;
    notifyListeners();
  }

  bool isExcursionSelected(ExcursionModel excursionModel) {
    return selectedExcursion == excursionModel;
  }

  bool isExcursionPart(ExcursionPart part) {
    return selectedPart == part;
  }

  void startPlay(ExcursionPart part) {
    player.open(Audio(part.assetAudio),
        autoStart: true, showNotification: true);
    notifyListeners();
  }

  void changePlayState() {
    if (isAudioPlaying) {
      pause();
    } else {
      play();
    }
  }

  void pause() {
    player.pause();
    notifyListeners();
  }

  void play() {
    player.play();
    notifyListeners();
  }
}
