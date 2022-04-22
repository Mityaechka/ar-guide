import 'package:flutter/cupertino.dart';

class NavigationData {
  String title;
  Widget route;
  bool showBackButton;

  NavigationData(this.title, this.showBackButton, this.route);
}

class NavigationIntent{

}