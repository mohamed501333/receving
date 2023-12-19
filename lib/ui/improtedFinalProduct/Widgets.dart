// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:jason_company/app/validation.dart';
import 'package:jason_company/controllers/ObjectBoxController.dart';
import 'package:jason_company/models/moderls.dart';
import 'package:jason_company/ui/commen/textformfield.dart';
import 'package:jason_company/ui/improtedFinalProduct/finalProductStock_viewmodel.dart';
import 'package:provider/provider.dart';

class HeaderOftable extends StatelessWidget {
  const HeaderOftable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        1: FlexColumnWidth(.8),
        2: FlexColumnWidth(.8),
        3: FlexColumnWidth(1.3),
        6: FlexColumnWidth(2.3),
        8: FlexColumnWidth(.6),
      },
      border: TableBorder.all(width: 1, color: Colors.black),
      children: [
        TableRow(
            decoration: BoxDecoration(
              color: Colors.amber[50],
            ),
            children: [
              Container(
                  padding: const EdgeInsets.all(4), child: const Text("حذف")),
              Container(
                  padding: const EdgeInsets.all(0), child: const Text('مقص')),
              Container(
                  padding: const EdgeInsets.all(0), child: const Text('كثافه')),
              Container(
                  padding: const EdgeInsets.all(4), child: const Text('عميل')),
              Container(
                  padding: const EdgeInsets.all(0), child: const Text('النوع')),
              Container(
                  padding: const EdgeInsets.all(4), child: const Text('لون')),
              Container(
                  padding: const EdgeInsets.all(4),
                  child: const Center(child: Text('مقاس'))),
              Container(
                  padding: const EdgeInsets.all(4), child: const Text('عدد')),
              Container(
                  padding: const EdgeInsets.all(4), child: const Text('م')),
            ])
      ],
    );
  }
}

class Fields extends StatelessWidget {
  const Fields({
    super.key,
    required this.vm,
  });

  final FinalProductStockViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTextFormField(
                width: MediaQuery.of(context).size.width * .18,
                hint: "النوع",
                keybordtupe: TextInputType.name,
                controller: vm.typecontroller,
                validator: Validation.validateothers,
              ),
              CustomTextFormField(
                width: MediaQuery.of(context).size.width * .18,
                hint: "الكثافه",
                controller: vm.densitycontroller,
                validator: Validation.validateothers,
              ),
              CustomTextFormField(
                width: MediaQuery.of(context).size.width * .18,
                hint: "اللون",
                keybordtupe: TextInputType.text,
                controller: vm.colercontroller,
                validator: Validation.validateothers,
              ),
              CustomTextFormField(
                width: MediaQuery.of(context).size.width * .18,
                keybordtupe: TextInputType.text,
                hint: "الشركه",
                controller: vm.companycontroller,
                validator: Validation.validateothers,
              ),
              CustomTextFormField(
                width: MediaQuery.of(context).size.width * .18,
                keybordtupe: TextInputType.number,
                hint: "مقص",
                controller: vm.scissorcontroller,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTextFormField(
                width: MediaQuery.of(context).size.width * .23,
                hint: "الارتفاع",
                controller: vm.hightncontroller,
                validator: Validation.validateothers,
              ),
              CustomTextFormField(
                width: MediaQuery.of(context).size.width * .23,
                hint: "العرض",
                controller: vm.widthcontroller,
                validator: Validation.validateothers,
              ),
              CustomTextFormField(
                width: MediaQuery.of(context).size.width * .23,
                hint: "الطول ",
                controller: vm.lenthcontroller,
                validator: Validation.validateothers,
              ),
              CustomTextFormField(
                width: MediaQuery.of(context).size.width * .23,
                hint: "العدد ",
                controller: vm.amountcontroller,
                validator: Validation.validateothers,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Chips2 extends StatelessWidget {
  const Chips2({
    super.key,
    required this.vm,
  });
  final FinalProductStockViewModel vm;
  @override
  Widget build(BuildContext context) {
    return Selector<ObjectBoxController, List<ChipfinalProducut>>(
      selector: (_, myType) => ObjectBoxController().chipsfinalprouduct,
      builder: (context, chips, child) {
        return SizedBox(
          height: 100,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    spacing: 9,
                    children: chips
                        .map((e) => InkWell(
                              onLongPress: () {
                                context
                                    .read<ObjectBoxController>()
                                    .deletechipfinalproduct(e.id);
                              },
                              onTap: () {
                                vm.fillFields(e);
                              },
                              child: Chip(
                                  labelStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  label: Text(e.title.toString())),
                            ))
                        .toList(),
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

class Buttoms extends StatelessWidget {
  const Buttoms({
    super.key,
    required this.vm,
  });
  final FinalProductStockViewModel vm;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChipsForFinalProduct(),
        const SizedBox(
          width: 30,
        ),
        ElevatedButton(
            onPressed: () {
              vm.add(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "اضافة",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}

//هنا زر اضافة الاختصارات
class ChipsForFinalProduct extends StatelessWidget {
  ChipsForFinalProduct({super.key});
  FinalProductStockViewModel vm = FinalProductStockViewModel();

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
                                    ' عمل اختصار جديد ',
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
                                        hint: "اللون",
                                        keybordtupe: TextInputType.text,
                                        controller: vm.colercontroller,
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
                                        keybordtupe: TextInputType.text,
                                        hint: "الشركه",
                                        controller: vm.companycontroller,
                                        validator: Validation.validateothers,
                                      ),
                                      CustomTextFormField(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .18,
                                        keybordtupe: TextInputType.number,
                                        hint: "مقص",
                                        controller: vm.scissorcontroller,
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomTextFormField(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .23,
                                        hint: "العدد ",
                                        controller: vm.amountcontroller,
                                        validator: Validation.validateothe,
                                      ),
                                      CustomTextFormField(
                                        keybordtupe: TextInputType.text,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .23,
                                        hint: "العنوان ",
                                        controller: vm.tiitlecontroller,
                                        validator: Validation.validateothe,
                                      ),
                                    ],
                                  )
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
                                          vm.addfinalproductchip(context);
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
