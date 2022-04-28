import 'package:ar_guide/models/excursion_part.dart';

class ExcursionModel {
  String name;
  String text;
  String image;

  String arImage;
  String arUri;

  List<ExcursionPart> parts;

  ExcursionModel(this.name, this.text, this.image, this.parts, this.arImage, this.arUri);
}
