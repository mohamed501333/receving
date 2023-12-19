// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
import 'package:flutter/material.dart';
import 'package:jason_company/controllers/blockFirebaseController.dart';
import 'package:provider/provider.dart';

import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/app/validation.dart';
import 'package:jason_company/controllers/ObjectBoxController.dart';
import 'package:jason_company/models/moderls.dart';
import 'package:jason_company/ui/H/H1_veiwModel.dart';
import 'package:jason_company/ui/commen/textformfield.dart';
import 'package:jason_company/ui/recources/color_manager.dart';
import 'package:jason_company/ui/theConstants/constans_view.dart';

// ignore: must_be_immutable
class H1Veiw extends StatefulWidget {
  const H1Veiw({super.key, required this.scissor});

  final int scissor;
  @override
  State<H1Veiw> createState() => _H1VeiwState();
}

class _H1VeiwState extends State<H1Veiw> {
  H1VeiwModel vm = H1VeiwModel();
  @override
  void dispose() {
    vm.permanentFractons.clear;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BlockFirebasecontroller>(
      builder: (context, b, child) {
        return Form(
          key: vm.formKey,
          child: Column(
            children: [
              fields(vm: vm, b: b.blocks),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Results(vm: vm),
                  Chips(
                    vm: vm,
                    b: b.blocks,
                    scissor: widget.scissor,
                  ),
                  buttoms(
                    vm: vm,
                    b: b.blocks,
                    scissor: widget.scissor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const HeaderOftable2(),
              TheTable(
                vm: vm,
                scissor: widget.scissor,
              )
            ],
          ),
        );
      },
    );
  }
}

class Results extends StatelessWidget {
  const Results({
    super.key,
    required this.vm,
  });

  final H1VeiwModel vm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Selector<ObjectBoxController, List<FractionModel>>(
        selector: (_, myType) => ObjectBoxController().fractions,
        builder: (context, fractions, child) {
          return Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: vm.permanentFractons
                      .map(
                        (e) => Container(
                            margin:
                                const EdgeInsets.only(bottom: 12, right: 12),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: ColorManager.gray,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: ColorManager.blueGrey, width: 3)),
                            child: Text(
                              "${e.hight}*${e.wedth}*${e.lenth}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                      )
                      .toList(),
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}

class Chips extends StatelessWidget {
  const Chips({
    super.key,
    required this.vm,
    required this.b,
    required this.scissor,
  });
  final H1VeiwModel vm;
  final List<BlockModel> b;
  final int scissor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 150,
      child: Column(
        children: [
          Selector<ObjectBoxController, List<ChipFraction>>(
            selector: (_, myType) => ObjectBoxController().fractionchips,
            builder: (context, chips, child) {
              return Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    spacing: 9,
                    children: chips
                        .map((e) => InkWell(
                              onLongPress: () {
                                context
                                    .read<ObjectBoxController>()
                                    .deleteFractionchip(e.id);
                              },
                              onTap: () {
                                vm.fillFields(e);
                                if (vm.validate()) {
                                  vm.addpermanentFractons(context, b, scissor);
                                  context.read<ObjectBoxController>().get();
                                  vm.clearfields();
                                }
                              },
                              child: Chip(
                                  labelStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  label: Text(
                                      "  ${e.hight.removeTrailingZeros.toString()}* ${e.width.removeTrailingZeros.toString()}* ${e.lenth.removeTrailingZeros.toString()}")),
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class buttoms extends StatelessWidget {
  const buttoms({
    super.key,
    required this.b,
    required this.vm,
    required this.scissor,
  });
  final List<BlockModel> b;
  final int scissor;
  final H1VeiwModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              if (vm.validate()) {
                vm.addpermanentFractons(context, b, scissor);
                context.read<ObjectBoxController>().get();
                vm.clearfields();
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                " ناتج ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
        ChipsForH123(),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              if (vm.permanentFractons.isNotEmpty) {
                vm.add_fraction(context, b, scissor);
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                " قص",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}

class fields extends StatelessWidget {
  const fields({
    super.key,
    required this.b,
    required this.vm,
  });
  final List<BlockModel> b;
  final H1VeiwModel vm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 18),
            child: CustomTextFormField(
                hint: " الارتفاع",
                width: 90,
                validator: Validation.validateothers,
                controller: vm.hightcontroller),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 18),
            child: CustomTextFormField(
                hint: "العرض ",
                width: 90,
                validator: Validation.validateothers,
                controller: vm.widthcontroller),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 18),
            child: CustomTextFormField(
                hint: " الطول",
                width: 90,
                validator: Validation.validateothers,
                controller: vm.lenthcontroller),
          ),
          Column(
            children: [
              DropDdowen(b: b),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                child: CustomTextFormField(
                    autovalidate: true,
                    hint: "رقم البلوك ",
                    width: 90,
                    validator: vm.validate_if_Exist(
                        b.where((e) => e.consumed == true).toList(), context),
                    controller: vm.numbercontroller),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderOftable2 extends StatelessWidget {
  const HeaderOftable2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(.3),
          1: FlexColumnWidth(.8),
          2: FlexColumnWidth(.8),
          3: FlexColumnWidth(.5),
          4: FlexColumnWidth(.3),
          5: FlexColumnWidth(.3),
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
                    padding: const EdgeInsets.all(4),
                    child: const Text("ناتج2")),
                Container(
                    padding: const EdgeInsets.all(4),
                    child: const Text("ناتج1")),
                Container(
                    padding: const EdgeInsets.all(4),
                    child: const Text("الكود")),
                Container(
                    padding: const EdgeInsets.all(4),
                    child: const Center(child: Text('رقم'))),
                Container(
                    padding: const EdgeInsets.all(4), child: const Text('م')),
              ])
        ],
      ),
    );
  }
}

class TheTable extends StatelessWidget {
  const TheTable({
    super.key,
    required this.vm,
    required this.scissor,
  });
  final H1VeiwModel vm;
  final int scissor;

  @override
  Widget build(BuildContext context) {
    int x = 0;
    return Selector<ObjectBoxController, List<FractionModel>>(
      selector: (_, myType) => ObjectBoxController().fractions,
      builder: (context, fractions, child) {
        return Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(.3),
                1: FlexColumnWidth(.8),
                2: FlexColumnWidth(.8),
                3: FlexColumnWidth(.5),
                4: FlexColumnWidth(.3),
                5: FlexColumnWidth(.3),
              },
              children: fractions
                  .filter_date(context)
                  .where((element) => element.hscissor == scissor)
                  .toList()
                  .filteronFractionModel()
                  .map((fraction) {
                x++;

                return TableRow(
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.all(4),
                          child: GestureDetector(
                              onTap: () {
                                vm.delete(fractions, fraction, context);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))),
                      Container(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                              children: vm
                                  .get_Fractions_of_individual_Fraction(
                                      fractions, fraction)
                                  .getRange(
                                      1,
                                      vm
                                          .get_Fractions_of_individual_Fraction(
                                              fractions, fraction)
                                          .length)
                                  .map((e) => Container(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(
                                          "${e.hight}*${e.wedth}*${e.lenth}")))
                                  .toList())),
                      Container(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                              "${vm.get_Fractions_of_individual_Fraction(fractions, fraction)[0].hight}*${vm.get_Fractions_of_individual_Fraction(fractions, fraction)[0].wedth}*${vm.get_Fractions_of_individual_Fraction(fractions, fraction)[0].lenth}")),
                      Container(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            fraction.serial.toString(),
                          )),
                      Container(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            fraction.blockmodelmum.toString(),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 221, 2, 75)),
                          )),
                      Container(
                          padding: const EdgeInsets.all(4), child: Text("$x")),
                    ]);
              }).toList(),
              border: TableBorder.all(width: 1, color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}

class DropDdowen extends StatelessWidget {
  const DropDdowen({super.key, required this.b});
  final List<BlockModel> b;

  @override
  Widget build(BuildContext context) {
    return Consumer<ObjectBoxController>(
      builder: (context, v, child) {
        b.isEmpty
            ? context.read<ObjectBoxController>().serial = null
            : DoNothingAction();
        return DropdownButton(
            value: context.read<ObjectBoxController>().serial,
            items: b
                .filterserials()
                .map((e) => e.serial)
                .toList()
                .map((e) => DropdownMenuItem(
                      value: e.toInt(),
                      child: Text(e.toString()),
                    ))
                .toList(),
            onChanged: (v) {
              if (v != null) {
                context.read<ObjectBoxController>().serial = v.toInt();
                context.read<ObjectBoxController>().get();
              }
            });
      },
    );
  }
}
