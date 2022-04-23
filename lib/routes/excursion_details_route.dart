
import 'package:ar_guide/infrastructure/app_colors.dart';
import 'package:ar_guide/infrastructure/text_styles.dart';
import 'package:flutter/cupertino.dart';

import '../infrastructure/box_decorations.dart';
import '../models/excursion_model.dart';
import '../state_managment/store.dart';
import 'package:provider/provider.dart';

class ExcursionDetailsRoute extends StatelessWidget {
  final ExcursionModel excursion;

  const ExcursionDetailsRoute({Key? key, required this.excursion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(builder: (context, store, child) {
      return Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 50),
              child: Text(
                excursion.text,
                style: TextStyles.p(),
                textAlign: TextAlign.center,
              )),
          Image.asset(
            excursion.image,
            width: 100,
            height: 100,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var part in excursion.parts)
                    excursionPartContainer(part.name, part.description,
                        store.isExcursionPart(part), () {
                      store.setSelectedPart(part);
                    }),
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  Widget excursionPartContainer(
      String name, String description, bool isSelect, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: AppBoxDecorations.rounded(
            AppColors.orange, isSelect ? AppColors.yellow : AppColors.white, 15,
            width: 3),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              textAlign: TextAlign.left,
              style: TextStyles.h1(),
            ),
            Text(
              description,
              style: TextStyles.p(),
            )
          ],
        ),
      ),
    );
  }
}
