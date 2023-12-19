// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/controllers/fireStoreController.dart';
import 'package:jason_company/ui/improtedFinalProduct/Widgets.dart';
import 'package:provider/provider.dart';
import 'package:jason_company/ui/improtedFinalProduct/finalProductStock_viewmodel.dart';

// ignore: must_be_immutable
class FinalProductView extends StatelessWidget {
  FinalProductView({super.key});

  FinalProductStockViewModel vm = FinalProductStockViewModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: vm.formKey,
          child: Column(
            children: [
              Fields(vm: vm),
              Chips2(vm: vm),
              Buttoms(vm: vm),
              const HeaderOftable(),
              theTable(),
            ],
          ),
        ),
      ),
    );
  }

  theTable() {
    return Consumer<Firebasecontroller>(
      builder: (context, finalproducts, child) {
        int x = 0;

        return Expanded(
          child: SingleChildScrollView(
            child: Table(
              columnWidths: const {
                1: FlexColumnWidth(.8),
                2: FlexColumnWidth(.8),
                3: FlexColumnWidth(1.3),
                6: FlexColumnWidth(2.3),
                8: FlexColumnWidth(.6),
              },
              children: finalproducts.finalproducts
                  .filter_date(context)
                  .where((element) => element.improted == true)
                  .toList()
                  .filter_date(context)
                  .map((user) {
                    x++;

                    return TableRow(
                        decoration: BoxDecoration(
                          color: finalproducts.finalproducts
                                          .filter_date(context)
                                          .indexOf(user) %
                                      2 ==
                                  0
                              ? Colors.teal[50]
                              : Colors.amber[50],
                        ),
                        children: [
                          Container(
                              padding: const EdgeInsets.all(4),
                              child: GestureDetector(
                                  onTap: () {
                                    vm.deletefinalproduct(context, user.id);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))),
                          Container(
                              padding: const EdgeInsets.all(2),
                              child: Text(user.scissor.toString())),
                          Container(
                              padding: const EdgeInsets.all(2),
                              child: Text(user.density.toString())),
                          Container(
                              padding: const EdgeInsets.all(2),
                              child: Text(user.company.toString())),
                          Container(
                              padding: const EdgeInsets.all(1),
                              child: Text(user.type.toString())),
                          Container(
                              padding: const EdgeInsets.all(0),
                              child: Text(user.color)),
                          Container(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                  "${user.hight.removeTrailingZeros}*${user.width.removeTrailingZeros}*${user.lenth.removeTrailingZeros}")),
                          Container(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                user.amount.toString(),
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 221, 2, 75)),
                              )),
                          Container(
                              padding: const EdgeInsets.all(4),
                              child: Text("$x")),
                        ]);
                  })
                  .toList()
                  .reversed
                  .toList(),
              border: TableBorder.all(width: 1, color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
