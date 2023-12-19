// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jason_company/main.dart';
import 'package:jason_company/models/moderls.dart';

class ObjectBoxController extends ChangeNotifier {
  // addBlock(BlockModel block) {
  //   database.addBlock(block);
  //   notifyListeners();
  // }

  addchips(ChipBlockModel chip) {
    database.addchips(chip);
    notifyListeners();
  }

  // addfinalProduct(FinalProductModel f) {
  //   database.addFinalProuduct(f);
  //   notifyListeners();
  // }

  addfinalProductchips(ChipfinalProducut chip) {
    database.addfinalProuductchips(chip);
    notifyListeners();
  }

  addFraction(List<FractionModel> fract) {
    database.addFraction(fract);
    notifyListeners();
  }

  addFractionchip(ChipFraction fract) {
    database.addFractionchip(fract);
    notifyListeners();
  }

  List<ChipBlockModel> chips = database.getchips();
  // List<BlockModel> blocks = database.getblocks();
  List<ChipfinalProducut> chipsfinalprouduct = database.getfinalProuductchips();
  // List<FinalProductModel> finalproducts = database.getFinalProuduct();
  List<FractionModel> fractions = database.getFraction();
  List<ChipFraction> fractionchips = database.getFractionchip();

  deletechip(id) {
    database.deletechip(id);
    notifyListeners();
  }

  // deleteblock(id) {
  //   database.deleteblock(id);
  //   notifyListeners();
  // }

  deletechipfinalproduct(id) {
    database.deletefinalProuductchips(id);
    notifyListeners();
  }

  // deletefinalProudut(id) {
  //   database.deleteFinalProuduct(id);
  //   notifyListeners();
  // }

  deleteFraction(id) {
    database.deleteFraction(id);
    notifyListeners();
  }

  deleteFractionchip(id) {
    database.deleteFractionchip(id);
    notifyListeners();
  }

  // finishBlick(int id, int scissor) {
  //   database.finishBloc(id, scissor);
  //   notifyListeners();
  // }

  // consumeBlock(int id) {
  //   database.consumeBlock(id);
  //   notifyListeners();
  // }

  // unconsumeBlock(int id) {
  //   database.unconsumeBlock(id);
  //   notifyListeners();
  // }

  get() {
    notifyListeners();
  }

  int? serial;
}
