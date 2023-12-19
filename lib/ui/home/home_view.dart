import 'package:flutter/material.dart';
import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/ui/cutting_order/cutting_order_view.dart';
import 'package:jason_company/ui/improtedFinalProduct/improtedFinalProduct_view.dart';
import 'package:jason_company/ui/main/componants/item_widget.dart';

import 'package:jason_company/ui/recources/color_manager.dart';
import 'package:jason_company/ui/recources/icons_manager.dart';
import 'package:jason_company/ui/recources/strings_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Item(
              MediaQuery.of(context).size.width * .45,
              const Color.fromARGB(255, 73, 88, 99),
              SringsManager.itemTitle2,
              IconsManager.itemIcon1,
              ontap: () {
                context.gonext(FinalProductView());
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Item(
              MediaQuery.of(context).size.width * .45,
              ColorManager.teal,
              SringsManager.itemTitle10,
              IconsManager.itemIcon1,
              ontap: () {
                context.gonext(const CuttingOrderView());
              },
            ),
          ],
        ),
      ],
    );
  }
}
