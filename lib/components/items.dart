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

import '../infrastructure/text_styles.dart';

class Items extends StatelessWidget {
  final List<ItemModel> items;
  final void Function(ItemModel item) onSelectItem;

  const Items(
      {Key? key,
      required this.onSelectItem,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              "Some Text",
              style: TextStyles.h1(),
            ),
          ),
          for (var item in items)
            Item(
              name: item.name,
              text: item.text,
              image: item.image,
              isSelect: item.isSelect,
              onSelect: () {
                onSelectItem(item);
              },
            ),
        ],
      ),
    );
  }
}
