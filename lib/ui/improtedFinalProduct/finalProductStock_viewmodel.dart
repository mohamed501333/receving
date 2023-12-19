// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/controllers/ObjectBoxController.dart';
import 'package:jason_company/controllers/fireStoreController.dart';
import 'package:jason_company/main.dart';
import 'package:jason_company/models/moderls.dart';
import 'package:jason_company/ui/base/base_view_mode.dart';
import 'package:provider/provider.dart';

class FinalProductStockViewModel extends BaseViewModel {
  TextEditingController timecontroller = TextEditingController();

  incertfinalProduct(BuildContext context) {
    context.read<Firebasecontroller>().addfinalProduct(FinalProductModel(
        id: DateTime.now().millisecondsSinceEpoch,
        color: colercontroller.text,
        density: int.parse(densitycontroller.text),
        type: typecontroller.text,
        amount: int.parse(amountcontroller.text),
        time: DateTime.now(),
        scissor: int.tryParse(scissorcontroller.text) ?? 0,
        width: double.parse(widthcontroller.text),
        lenth: double.parse(lenthcontroller.text),
        hight: double.parse(hightncontroller.text),
        company: companycontroller.text,
        timeofOut: DateTime.parse("2001-01-01")));
  }

  fillFields(ChipfinalProducut chi) {
    colercontroller.text = chi.color;
    densitycontroller.text = chi.density.removeTrailingZeros.toString();
    typecontroller.text = chi.type;
    hightncontroller.text = chi.hight.removeTrailingZeros.toString();
    widthcontroller.text = chi.width.removeTrailingZeros.toString();
    lenthcontroller.text = chi.lenth.removeTrailingZeros.toString();
    scissorcontroller.text = chi.scissor.toString();
    companycontroller.text = chi.company;
  }

  deletefinalproduct(BuildContext context, id) {
    context.read<Firebasecontroller>().deletefinalProudut(id);
  }

  void add(BuildContext context) {
    if (formKey.currentState!.validate()) {
      incertfinalProduct(context);
      clearfields();
    }
  }

  addfinalproductchip(BuildContext context) {
    database.addfinalProuductchips(ChipfinalProducut(
        scissor: scissorcontroller.text,
        title: tiitlecontroller.text,
        color: colercontroller.text,
        density: double.tryParse(densitycontroller.text) ?? 0,
        type: typecontroller.text,
        amount: double.tryParse(amountcontroller.text) ?? 0,
        number: double.tryParse(blocknumbercontroller.text) ?? 0,
        width: double.tryParse(widthcontroller.text) ?? 0,
        lenth: double.tryParse(lenthcontroller.text) ?? 0,
        hight: double.tryParse(hightncontroller.text) ?? 0,
        company: companycontroller.text));
    context.read<ObjectBoxController>().get();
  }
}
