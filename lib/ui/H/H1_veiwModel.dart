// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/controllers/ObjectBoxController.dart';
import 'package:jason_company/controllers/blockFirebaseController.dart';
import 'package:jason_company/main.dart';
import 'package:jason_company/models/moderls.dart';
import 'package:jason_company/ui/base/base_view_mode.dart';
import 'package:provider/provider.dart';

class H1VeiwModel extends BaseViewModel {
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController hightcontroller = TextEditingController();
  TextEditingController constantserial = TextEditingController();

// get all fractions which is serial and block id equal to frac
  List<FractionModel> get_Fractions_of_individual_Fraction(
      List<FractionModel> fractions, FractionModel frac) {
    return fractions
        .where((element) =>
            element.blockmodelmum == frac.blockmodelmum &&
            element.serial == frac.serial)
        .toList();
  }

  BlockModel get_block_of_num_in_controller(
      List<BlockModel> b, BuildContext context) {
    BlockModel m = b
        .where((e) =>
            e.number == int.parse(numbercontroller.text) &&
            e.serial == context.read<ObjectBoxController>().serial)
        .toList()[0];
    return m;
  }

  validate_if_Exist(List<BlockModel> b, BuildContext context) {
    return (String? value) {
      if (value!.isEmpty) {
        return "فارغ";
      }
      var condition = !b.map((e) => e.number).contains(int.parse(value));
      if (condition) {
        return "غير موجود";
      }
      var condition3 = !b
          .map((e) => e.serial)
          .contains(context.read<ObjectBoxController>().serial);

      if (condition3) {
        return "غير موجود";
      }
      List<bool> condition5 = b
          .where((e) =>
              e.number == int.parse(value) &&
              e.serial == context.read<ObjectBoxController>().serial)
          .map((e) => e.isfineshed)
          .toList();

      if (condition5.isEmpty) {
        return "غير موجود";
      }

      bool condition2 = b
          .where((e) =>
              e.number == int.parse(value) &&
              e.serial == context.read<ObjectBoxController>().serial)
          .map((e) => e.isfineshed)
          .toList()[0];

      if (condition2) {
        return "تم التصنيع ";
      }

      return null;
    };
  }

  List<FractionModel> permanentFractons = [];

  addpermanentFractons(BuildContext context, List<BlockModel> b, int scissor) {
    permanentFractons.add(FractionModel(
        blockmodelmum: get_block_of_num_in_controller(b, context).number,
        wedth: int.parse(widthcontroller.text),
        lenth: int.parse(lenthcontroller.text),
        hight: int.parse(hightcontroller.text),
        density: get_block_of_num_in_controller(b, context).density,
        type: get_block_of_num_in_controller(b, context).type,
        serial: get_block_of_num_in_controller(b, context).serial,
        hscissor: scissor,
        color: get_block_of_num_in_controller(b, context).color,
        time: DateTime.now(),
        timeofRscissor: DateTime.parse("2001-01-01")));
  }

  add_fraction(BuildContext context, List<BlockModel> b, int scissor) {
    if (permanentFractons.isNotEmpty) {
      context.read<ObjectBoxController>().addFraction(permanentFractons);
      finishblock(context, b, scissor);

      clearfields();
      numbercontroller.clear();
      permanentFractons.clear();
    }
  }

  @override
  clearfields() {
    lenthcontroller.clear();
    hightcontroller.clear();
    widthcontroller.clear();
  }

  finishblock(BuildContext context, List<BlockModel> b, int scissor) {
    BlockModel m = b
        .where((e) =>
            e.number == get_block_of_num_in_controller(b, context).number &&
            e.serial == context.read<ObjectBoxController>().serial)
        .toList()[0];
    context.read<BlockFirebasecontroller>().finishblock(m.id, scissor);
  }

  get_blockid_from_fractionnum(int num, int serial, BuildContext context) {
    return context
        .read<BlockFirebasecontroller>()
        .blocks
        .where((e) => e.number == num && e.serial == serial)
        .toList()[0]
        .id;
  }

  List<int> filterserials(List<BlockModel> blocks) {
    return blocks.filterserials().map((e) => e.serial).toList();
  }

  fillFields(ChipFraction chi) {
    hightcontroller.text = chi.hight.removeTrailingZeros.toString();
    widthcontroller.text = chi.width.removeTrailingZeros.toString();
    lenthcontroller.text = chi.lenth.removeTrailingZeros.toString();
  }

//delete fraction and unfinish block
  void delete(List<FractionModel> fractions, FractionModel fraction,
      BuildContext context) {
    database.deleteFraction(get_Fractions_of_individual_Fraction(
      fractions,
      fraction,
    ).map((e) => e.id).toList());

    context.read<BlockFirebasecontroller>().unfinishblock(
        get_blockid_from_fractionnum(
            fraction.blockmodelmum, fraction.serial, context));

    context.read<ObjectBoxController>().get();
  }
}
