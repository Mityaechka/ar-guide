/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsArGen {
  const $AssetsArGen();

  /// File path: assets/ar/bird.fbx
  String get birdFbx => 'assets/ar/bird.fbx';

  /// File path: assets/ar/bird.gltf
  String get birdGltf => 'assets/ar/bird.gltf';

  /// File path: assets/ar/mark_bird.jpg
  AssetGenImage get markBird => const AssetGenImage('assets/ar/mark_bird.jpg');
}

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/example.mp3
  String get example => 'assets/audio/example.mp3';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/goban.png
  AssetGenImage get goban => const AssetGenImage('assets/images/goban.png');

  /// File path: assets/images/icon_menu.png
  AssetGenImage get iconMenu =>
      const AssetGenImage('assets/images/icon_menu.png');

  /// File path: assets/images/icon_qr.png
  AssetGenImage get iconQr => const AssetGenImage('assets/images/icon_qr.png');

  /// File path: assets/images/icon_settings.png
  AssetGenImage get iconSettings =>
      const AssetGenImage('assets/images/icon_settings.png');

  /// File path: assets/images/sakura.png
  AssetGenImage get sakura => const AssetGenImage('assets/images/sakura.png');

  /// File path: assets/images/tea_house.png
  AssetGenImage get teaHouse =>
      const AssetGenImage('assets/images/tea_house.png');
}

class Assets {
  Assets._();

  static const $AssetsArGen ar = $AssetsArGen();
  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
