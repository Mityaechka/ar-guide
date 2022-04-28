import 'package:ar_guide/infrastructure/navigation_controller.dart';
import 'package:ar_guide/models/excursion_model.dart';
import 'package:ar_guide/routes/ar_route.dart';
import 'package:ar_guide/routes/excursion_details_route.dart';

import '../models/navigation_data.dart';
import '../routes/main_route.dart';

class Routes {
  static NavigationData main(NavigationController controller) {
    return NavigationData("Главная", false, MainRoute(navigation: controller));
  }

  static NavigationData excursionDetails(NavigationController controller,ExcursionModel excursion) {
    return NavigationData(excursion.name, true, ExcursionDetailsRoute(excursion: excursion,));
  }

  static NavigationData ar(NavigationController controller) {
    return NavigationData("Сканировать QR", true, ArRoute());
  }

}
