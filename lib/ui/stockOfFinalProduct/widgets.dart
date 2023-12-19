// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:jason_company/controllers/fireStoreController.dart';
import 'package:provider/provider.dart';

import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/app/validation.dart';
import 'package:jason_company/ui/commen/textformfield.dart';
import 'package:jason_company/ui/improtedFinalProduct/finalProductStock_viewmodel.dart';
import 'package:jason_company/ui/stockOfFinalProduct/Stock_of_finalProduct_ViewModel.dart';

class AddToStock extends StatelessWidget {
  AddToStock({super.key});
  stockOfFinalProductsViewModel vm = stockOfFinalProductsViewModel();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    scrollable: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    content: SizedBox(
                      height: 450,
                      child: SingleChildScrollView(
                        child: Form(
                          key: vm.formKey,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.blue[900],
                                height: 30,
                                child: const Center(
                                  child: Text(
                                    ' اضافة الى المخزن    ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomTextFormField(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .18,
                                        hint: "النوع",
                                        keybordtupe: TextInputType.name,
                                        controller: vm.typecontroller,
                                        validator: Validation.validateothers,
                                      ),
                                      CustomTextFormField(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .18,
                                        hint: "الكثافه",
                                        controller: vm.densitycontroller,
                                        validator: Validation.validateothers,
                                      ),
                                      CustomTextFormField(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .18,
                                        keybordtupe: TextInputType.text,
                                        hint: "الشركه",
                                        controller: vm.companycontroller,
                                        validator: Validation.validateothers,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomTextFormField(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .18,
                                        keybordtupe: TextInputType.number,
                                        hint: "الكميه",
                                        controller: vm.amountcontroller,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomTextFormField(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .18,
                                        hint: "الارتفاع",
                                        controller: vm.hightncontroller,
                                        validator: Validation.validateothers,
                                      ),
                                      CustomTextFormField(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .18,
                                        hint: "العرض",
                                        controller: vm.widthcontroller,
                                        validator: Validation.validateothers,
                                      ),
                                      CustomTextFormField(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .18,
                                        hint: "الطول ",
                                        controller: vm.lenthcontroller,
                                        validator: Validation.validateothers,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red)),
                                        onPressed: () {
                                          vm.add(context);
                                        },
                                        child: const Text('أضافه')),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('الغاء')),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
        },
        icon: const Icon(Icons.add));
  }
}

class HistoryOfAdingToStock extends StatelessWidget {
  HistoryOfAdingToStock({
    super.key,
    required this.condition,
  });
  FinalProductStockViewModel vm = FinalProductStockViewModel();
  final int condition;
  @override
  Widget build(BuildContext context) {
    return Consumer<Firebasecontroller>(
      builder: (context, finalproducts, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("سجل الاضافه"),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Table(
                    columnWidths: const {
                      4: FlexColumnWidth(2),
                    },
                    children: finalproducts.finalproducts
                        .filter_date(context)
                        .where((element) =>
                            element.improted == false && condition == 1
                                ? element.amount > 0
                                : element.amount < 0)
                        .toList()
                        .filter_date(context)
                        .map((user) {
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
                                child: Text(user.density.toString())),
                            Container(
                                padding: const EdgeInsets.all(2),
                                child: Text(user.company.toString())),
                            Container(
                                padding: const EdgeInsets.all(1),
                                child: Text(user.type.toString())),
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
                          ]);
                    }).toList(),
                    border: TableBorder.all(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

dialog(BuildContext context, stockOfFinalProductsViewModel vm,
    ItemModel itemData, GroupModel headerData) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            scrollable: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SizedBox(
              height: 250,
              child: SingleChildScrollView(
                child: Form(
                  key: vm.formKey,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.blue[900],
                        height: 30,
                        child: const Center(
                          child: Text(
                            'اضافه الى هذا المقاس',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomTextFormField(
                                autovalidate: true,
                                validator: Validation.validateothers,
                                width: MediaQuery.of(context).size.width * .18,
                                keybordtupe: TextInputType.number,
                                hint: "الكميه",
                                controller: vm.amountcontroller,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const SizedBox(height: 15),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                                onPressed: () {
                                  vm.addtocertinsize(
                                      context, itemData, headerData);
                                  Navigator.pop(context);
                                },
                                child: const Text('أضافه')),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('الغاء')),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
}
