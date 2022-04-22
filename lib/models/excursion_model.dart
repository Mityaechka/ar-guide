import 'package:ar_guide/models/excursion_part.dart';

class ExcursionModel {
  String name;
  String text;
  String image;

  List<ExcursionPart> parts;

  ExcursionModel(this.name, this.text, this.image, this.parts);
}
