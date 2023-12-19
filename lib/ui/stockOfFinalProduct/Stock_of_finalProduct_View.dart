// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/controllers/fireStoreController.dart';
import 'package:jason_company/ui/recources/color_manager.dart';
import 'package:jason_company/ui/stockOfFinalProduct/Stock_of_finalProduct_ViewModel.dart';
import 'package:jason_company/ui/stockOfFinalProduct/widgets.dart';
import 'package:provider/provider.dart';

import 'package:section_view/section_view.dart';

class FinalProductStockView extends StatelessWidget {
  FinalProductStockView({super.key});

  stockOfFinalProductsViewModel vm = stockOfFinalProductsViewModel();

  @override
  Widget build(BuildContext context) {
    return Consumer<Firebasecontroller>(
      builder: (context, finalproducts, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              AddToStock(),
              IconButton(
                  onPressed: () => context.gonext(HistoryOfAdingToStock(
                        condition: 1,
                      )),
                  icon: const Icon(Icons.history))
            ],
            title: const Center(child: Text("رصيد منتج تام الصنع")),
          ),
          body: SectionView<GroupModel, ItemModel>(
              source: vm.source(finalproducts.finalproducts),
              onFetchListData: (header) => header.items,
              headerBuilder: (BuildContext context, GroupModel headerData,
                  int headerIndex) {
                return headerData.items
                            .map((e) => e.total)
                            .reduce((a, b) => a = b) ==
                        0
                    ? const SizedBox()
                    : Container(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          child: Text(
                            headerData.name.toString(),
                            style: const TextStyle(
                                fontSize: 18, color: ColorManager.white),
                          ),
                        ),
                      );
              },
              itemBuilder: (context, itemData, itemIndex, headerData,
                      headerIndex) =>
                  itemData.total == 0
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () {
                            dialog(context, vm, itemData, headerData);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(.5),
                            decoration: BoxDecoration(
                                color: Colors.blue[50],
                                border: Border.all(width: .5)),
                            child: ListTile(
                              trailing: Text(
                                "${itemData.total}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.red),
                              ),
                              leading: Text("${itemData.density}" "ك"),
                              title: Row(
                                children: [
                                  Text(itemData.type.toString()),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Text("${itemData.lenth.removeTrailingZeros}"
                                      "*"
                                      "${itemData.width.removeTrailingZeros}"
                                      "*"
                                      " ${itemData.hight.removeTrailingZeros}"),
                                ],
                              ),
                            ),
                          ),
                        )),
        );
      },
    );
  }
}
