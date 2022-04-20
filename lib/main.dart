import 'package:ar_guide/components/ItemDetails.dart';
import 'package:ar_guide/components/header.dart';
import 'package:ar_guide/components/item.dart';
import 'package:ar_guide/components/items.dart';
import 'package:ar_guide/components/player.dart';
import 'package:ar_guide/components/player_hotbar.dart';
import 'package:ar_guide/gen/assets.gen.dart';
import 'package:ar_guide/state_managment/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/bottom_bar.dart';
import 'infrastructure/text_styles.dart';

class Pages {
  static final int Items = 0;
  static final int ItemDetail = 1;
}

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Store(), child: MaterialApp(home: MyApp())));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  String title = "Главная";
  int currentPage = Pages.Items;

  bool get showBackButton {
    return currentPage == Pages.ItemDetail;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(body: Consumer<Store>(
          builder: (context, store, child) {
            return Column(
              children: [
                Header(
                  title: title,
                  showButton: showBackButton,
                  onCloseClick: backPress,
                ),
                Expanded(
                    child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {},
                  children: [
                    Items(
                      items: store.items,
                      onSelectItem: (item) {
                        setState(() {
                          title = item.name;
                        });
                        store.setSelectedItem(item);
                        navigate(Pages.ItemDetail);
                      },
                    ),
                    ItemDetails()
                  ],
                )),
                PlayerHotbar(),
                const BottomBar()
              ],
            );
          },
        )));
  }

  void navigate(int index) {
    setState(() {
      currentPage = index;
    });

    pageController.animateToPage(index,
        duration: Duration(milliseconds: 250), curve: Curves.ease);
  }

  void backPress() {
    if (currentPage == Pages.ItemDetail) {
      setState(() {
        title = "Главная";
      });
      navigate(Pages.Items);
    }
  }
}
