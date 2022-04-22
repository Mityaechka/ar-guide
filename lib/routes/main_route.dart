import 'package:ar_guide/routes/excursion_details_route.dart';
import 'package:ar_guide/components/header.dart';
import 'package:ar_guide/components/excursion_container.dart';
import 'package:ar_guide/components/player.dart';
import 'package:ar_guide/components/player_hotbar.dart';
import 'package:ar_guide/gen/assets.gen.dart';
import 'package:ar_guide/infrastructure/navigation_controller.dart';
import 'package:ar_guide/models/navigation_data.dart';
import 'package:ar_guide/state_managment/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../infrastructure/text_styles.dart';

class MainRoute extends StatelessWidget {
  final NavigationController navigation;

  const MainRoute({Key? key, required this.navigation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(
      builder: (context, store, child) {
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
              for (var excursion in Store.excursions)
                ExcursionContainer(
                  name: excursion.name,
                  text: excursion.text,
                  image: excursion.image,
                  isSelect: store.isExcursionSelected(excursion),
                  onSelect: () {
                    store.setSelectedExcursion(excursion);
                    navigation.navigate(
                        NavigationData(excursion.name, true, ExcursionDetailsRoute(excursion: excursion,)));
                    //onSelectItem(item);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
