import 'dart:html';

import 'package:ar_guide/models/item_model.dart';
import 'package:flutter/cupertino.dart';

import '../gen/assets.gen.dart';

class Store extends ChangeNotifier {
  final List<ItemModel> items = [
    ItemModel(
      "Гобан",
      "Игровое поле для игры в го, выполненное в виде толстого цельнодеревянного столика на невысоких ножках.",
      Assets.images.goban.path,
    ),
    ItemModel(
      "Сакура",
      "Японские вишни не плодоносят или дают мелкий, несъедобный плод.",
      Assets.images.sakura.path,
    ),
    ItemModel(
      "Тясицу",
      "Тясицу — чайный домик, атрибут японской чайной церемонии.",
      Assets.images.teaHouse.path,
    )
  ];
  late ItemModel selectedItem;

  Store() {
    selectedItem = items.first;
    setSelectedItem(selectedItem);
  }

  void setSelectedItem(ItemModel item) {
    selectedItem.isSelect = false;
    item.isSelect = true;
    selectedItem = item;
    notifyListeners();
  }
}
