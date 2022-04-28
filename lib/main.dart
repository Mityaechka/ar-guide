import 'package:ar_guide/infrastructure/navigation_controller.dart';
import 'package:ar_guide/infrastructure/routes.dart';
import 'package:ar_guide/models/navigation_data.dart';
import 'package:ar_guide/routes/excursion_details_route.dart';
import 'package:ar_guide/routes/main_route.dart';
import 'package:ar_guide/state_managment/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'components/ar/test.dart';
import 'components/bottom_bar.dart';
import 'components/header.dart';
import 'components/player_hotbar.dart';
import 'infrastructure/text_styles.dart';

void main() {
  //debugRepaintRainbowEnabled = true;
  runApp(ChangeNotifierProvider(
      create: (context) => Store(), child: MaterialApp(home: MyApp())));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements NavigationController {
  String title = "";
  Widget? route;
  bool showBackButton = false;

  List<NavigationData> navigationStack = [];

  @override
  void initState() {
    //navigate(Routes.excursionDetails(this, Store.excursions.first));
    navigate(Routes.ar(this));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(body: Consumer<Store>(builder: (context, store, i) {
          return SafeArea(
            child: Column(
              children: [
                Header(
                  title: title,
                  showButton: showBackButton,
                  onCloseClick: previous,
                ),
                Expanded(child: route!),
                if (store.selectedPart != null &&
                    store.selectedExcursion != null)
                  PlayerHotbar(),
                BottomBar()
              ],
            ),
          );
        })));
  }

  @override
  void navigate(NavigationData data) {
    navigationStack.add(data);
    push(data);
  }

  void push(NavigationData data) {
    setState(() {
      title = data.title;
      route = data.route;
      showBackButton = data.showBackButton;
    });
  }

  @override
  void previous() {
    navigationStack.remove(navigationStack.last);

    if (navigationStack.isEmpty) {
      push(Routes.main(this));
      return;
    }

    var data = navigationStack.last;
    navigationStack.remove(data);
    push(data);
  }
}
