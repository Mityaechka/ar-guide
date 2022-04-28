import 'dart:typed_data';
import 'package:ar_guide/models/excursion_model.dart';
import 'package:ar_guide/state_managment/store.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart';

class ArRoute extends StatefulWidget {
  const ArRoute({Key? key}) : super(key: key);

  @override
  _ArRouteState createState() => _ArRouteState();
}

class _ArRouteState extends State<ArRoute> {
  ArCoreNode? currentNode;

  late ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ArCoreView(
      onArCoreViewCreated: _onArCoreViewCreated,
      type: ArCoreViewType.AUGMENTEDIMAGES,
    ));
  }

  void _onArCoreViewCreated(ArCoreController controller) async {
    arCoreController = controller;
    arCoreController.onTrackingImage = _handleOnTrackingImage;

    Map<String, Uint8List> excursionsMap = {};

    for (var e in Store.excursions) {
      final ByteData bytes = await rootBundle.load(e.arImage);

      excursionsMap[e.name] = bytes.buffer.asUint8List();
    }

    arCoreController.loadMultipleAugmentedImage(bytesMap: excursionsMap);
  }

  _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
    if (currentNode != null) {
      arCoreController.removeNode(nodeName: currentNode!.name);
      currentNode = null;
    }

    var search = Store.excursions
        .where((element) => element.name == augmentedImage.name);

    if (search.isNotEmpty) {
      var excursion = search.first;

      final model = ArCoreReferenceNode(
        scale: Vector3.all(0.1),
          name: excursion.name,
          objectUrl: excursion.arUri,
          position: augmentedImage.centerPose.translation,
          rotation: augmentedImage.centerPose.rotation);

      arCoreController.addArCoreNodeToAugmentedImage(
          model, augmentedImage.index);
      currentNode = model;
    }
  }
}
