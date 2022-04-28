import 'dart:typed_data';


import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ObjectsOnPlanesWidget extends StatefulWidget {
  @override
  _ObjectsOnPlanesWidgetState createState() => _ObjectsOnPlanesWidgetState();
}

class _ObjectsOnPlanesWidgetState extends State<ObjectsOnPlanesWidget> {
  late ArCoreController arCoreController;

  @override
  void dispose() {
    super.dispose();
    arCoreController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Anchors & Objects on Planes'),
        ), body: ArCoreView(
      type: ArCoreViewType.AUGMENTEDIMAGES,
      onArCoreViewCreated: _onArCoreViewCreated,
      enableTapRecognizer: true,
    ));
  }

  void _onArCoreViewCreated(ArCoreController controller) async {
    final ByteData bytes = await rootBundle.load('assets/images/mark2.jpg');

    arCoreController = controller;

    arCoreController.onTrackingImage = _handleOnTrackingImage;

    arCoreController.loadSingleAugmentedImage(bytes: bytes.buffer.asUint8List());

  }

  _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
    // if (!augmentedImagesMap.containsKey(augmentedImage.index)) {
    //   augmentedImagesMap[augmentedImage.index] = augmentedImage;
      _addSphere(augmentedImage);
    //}
  }

  Future _addSphere(ArCoreAugmentedImage augmentedImage) async {
    final ByteData textureBytes = await rootBundle.load('assets/images/mark2.jpg');

    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      textureBytes: textureBytes.buffer.asUint8List(),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: augmentedImage.extentX / 2,
    );
    final node = ArCoreNode(
      shape: sphere,
    );
    arCoreController.addArCoreNodeToAugmentedImage(node, augmentedImage.index);
  }
}


class AugmentedPage extends StatefulWidget {
  @override
  _AugmentedPageState createState() => _AugmentedPageState();
}

class _AugmentedPageState extends State<AugmentedPage> {
 late  ArCoreController arCoreController;
  Map<int, ArCoreAugmentedImage> augmentedImagesMap = Map();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AugmentedPage'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          type: ArCoreViewType.AUGMENTEDIMAGES,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) async {
    arCoreController = controller;
    arCoreController.onTrackingImage = _handleOnTrackingImage;

    //AugmentedImageDatabase

    loadSingleImage();
    //OR
    //loadImagesDatabase();
  }

  loadSingleImage() async {
    final ByteData bytes =
    await rootBundle.load('assets/ar/mark_bi'
        ''
        ''
        'rd.jpg');
    arCoreController.loadSingleAugmentedImage(
        bytes: bytes.buffer.asUint8List());
  }

  loadImagesDatabase() async {
    final ByteData bytes = await rootBundle.load('assets/images/myimages.imgdb');
    arCoreController.loadAugmentedImagesDatabase(
        bytes: bytes.buffer.asUint8List());
  }

  _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
    if (!augmentedImagesMap.containsKey(augmentedImage.index)) {
      augmentedImagesMap[augmentedImage.index] = augmentedImage;
      _addSphere(augmentedImage);
    }
  }

  Future _addSphere(ArCoreAugmentedImage augmentedImage) async {

    final model = ArCoreReferenceNode(
        name: "test",
        objectUrl: "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb",
        position: augmentedImage.centerPose.translation,
        rotation: augmentedImage.centerPose.rotation);

    //arCoreController.addArCoreNodeWithAnchor(model, parentNodeName: "");

    //final ByteData textureBytes = await rootBundle.load('assets/images/mark2.jpg');
    //
    // final material = ArCoreMaterial(
    //   color: Color.fromARGB(120, 66, 134, 244),
    //   //textureBytes: textureBytes.buffer.asUint8List(),
    // );
    // final sphere = ArCoreSphere(
    //   materials: [material],
    //   radius: augmentedImage.extentX / 2,
    // );
    // final node = ArCoreNode(
    //   shape: sphere,
    // );
     arCoreController.addArCoreNodeToAugmentedImage(model, augmentedImage.index);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}