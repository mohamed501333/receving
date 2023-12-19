// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jason_company/controllers/setting_controller.dart';
import 'package:jason_company/models/moderls.dart';
import 'package:provider/provider.dart';

extension Brovider on BuildContext {
  gonext(Widget route) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => route));
  }
}

extension MeineVer on double {
  String get toMoney => '$removeTrailingZeros₺';
  String get removeTrailingZeros {
    // return if complies to int
    if (this % 1 == 0) return toInt().toString();
    // remove trailing zeroes
    String str = '$this'.replaceAll(RegExp(r'0*$'), '');
    // reduce fraction max length to 2
    if (str.contains('.')) {
      final fr = str.split('.');
      if (2 < fr[1].length) {
        str = '${fr[0]}.${fr[1][0]}${fr[1][1]}';
      }
    }
    return str;
  }
}

extension Toint on String {
  int to_int() {
    return int.tryParse(this) ?? 0;
  }
}

extension Filter on List<FinalProductModel> {
  List<FinalProductModel> filteronfinalproductwithcsissor() {
    List<FinalProductModel> nonRepetitive = [];
    for (var i = 0; i < length; i++) {
      bool repeated = false;
      for (var j = 0; j < nonRepetitive.length; j++) {
        if (this[i].hight == nonRepetitive[j].hight &&
            this[i].width == nonRepetitive[j].width &&
            this[i].lenth == nonRepetitive[j].lenth &&
            this[i].color == nonRepetitive[j].color &&
            this[i].type == nonRepetitive[j].type &&
            this[i].company == nonRepetitive[j].company &&
            this[i].scissor == nonRepetitive[j].scissor &&
            this[i].density == nonRepetitive[j].density) {
          repeated = true;
        }
      }
      if (!repeated) {
        nonRepetitive.add(this[i]);
      }
    }
    return nonRepetitive;
  }

  List<FinalProductModel> filteronfinalproduct() {
    List<FinalProductModel> nonRepetitive = [];
    for (var i = 0; i < length; i++) {
      bool repeated = false;
      for (var j = 0; j < nonRepetitive.length; j++) {
        if (this[i].hight == nonRepetitive[j].hight &&
            this[i].width == nonRepetitive[j].width &&
            this[i].lenth == nonRepetitive[j].lenth &&
            this[i].color == nonRepetitive[j].color &&
            this[i].type == nonRepetitive[j].type &&
            this[i].company == nonRepetitive[j].company &&
            this[i].density == nonRepetitive[j].density) {
          repeated = true;
        }
      }
      if (!repeated) {
        nonRepetitive.add(this[i]);
      }
    }
    return nonRepetitive;
  }

  List<FinalProductModel> filter_type_density() {
    List<FinalProductModel> nonRepetitive = [];
    for (var i = 0; i < length; i++) {
      bool repeated = false;
      for (var j = 0; j < nonRepetitive.length; j++) {
        if (this[i].type == nonRepetitive[j].type &&
            this[i].density == nonRepetitive[j].density) {
          repeated = true;
        }
      }
      if (!repeated) {
        nonRepetitive.add(this[i]);
      }
    }
    return nonRepetitive;
  }

  List<FinalProductModel> filter_company() {
    List<FinalProductModel> nonRepetitive = [];
    for (var i = 0; i < length; i++) {
      bool repeated = false;
      for (var j = 0; j < nonRepetitive.length; j++) {
        if (this[i].company == nonRepetitive[j].company) {
          repeated = true;
        }
      }
      if (!repeated) {
        nonRepetitive.add(this[i]);
      }
    }
    return nonRepetitive;
  }

  List<FinalProductModel> filter_density_type_size() {
    List<FinalProductModel> nonRepetitive = [];
    for (var i = 0; i < length; i++) {
      bool repeated = false;
      for (var j = 0; j < nonRepetitive.length; j++) {
        if (this[i].density == nonRepetitive[j].density &&
            this[i].type == nonRepetitive[j].type &&
            this[i].lenth == nonRepetitive[j].lenth &&
            this[i].width == nonRepetitive[j].width &&
            this[i].hight == nonRepetitive[j].hight) {
          repeated = true;
        }
      }
      if (!repeated) {
        nonRepetitive.add(this[i]);
      }
    }
    return nonRepetitive;
  }

  List<FinalProductModel> filter_date(BuildContext context) {
    DateFormat format = DateFormat('yyyy/MM/dd');
    return where((element) =>
        format.format(element.time) ==
        context.read<SettingController>().currentDate()).toList();
  }
}

extension Filterfgddf on List<FractionModel> {
  List<FractionModel> filteronFractionModel() {
    List<FractionModel> nonRepetitive = [];
    for (var i = 0; i < length; i++) {
      bool repeated = false;
      for (var j = 0; j < nonRepetitive.length; j++) {
        if (this[i].blockmodelmum == nonRepetitive[j].blockmodelmum &&
            this[i].serial == nonRepetitive[j].serial) {
          repeated = true;
        }
      }
      if (!repeated) {
        nonRepetitive.add(this[i]);
      }
    }
    return nonRepetitive;
  }

  List<FractionModel> filter_Fractios___() {
    List<FractionModel> nonRepetitive = [];
    for (var i = 0; i < length; i++) {
      bool repeated = false;
      for (var j = 0; j < nonRepetitive.length; j++) {
        if (this[i].lenth == nonRepetitive[j].lenth &&
            this[i].hight == nonRepetitive[j].hight &&
            this[i].wedth == nonRepetitive[j].wedth) {
          repeated = true;
        }
      }
      if (!repeated) {
        nonRepetitive.add(this[i]);
      }
    }
    return nonRepetitive;
  }

  List<FractionModel> filter_date(BuildContext context) {
    DateFormat format = DateFormat('yyyy/MM/dd');
    return where((element) =>
        format.format(element.time) ==
        context.read<SettingController>().currentDate()).toList();
  }
}

extension A1 on List<BlockModel> {
  List<BlockModel> filterserials() {
    List<BlockModel> nonRepetitive = [];

    for (var i = 0; i < length; i++) {
      bool repeated = false;
      for (var j = 0; j < nonRepetitive.length; j++) {
        if (this[i].serial == nonRepetitive[j].serial) {
          repeated = true;
        }
      }
      if (!repeated) {
        nonRepetitive.add(this[i]);
      }
    }
    return nonRepetitive;
  }

  List<BlockModel> filter_date(BuildContext context) {
    DateFormat format = DateFormat('yyyy/MM/dd');
    return where((element) =>
        format.format(element.time) ==
        context.read<SettingController>().currentDate()).toList();
  }

  List<BlockModel> filter_filter_type_and_density() {
    List<BlockModel> nonRepetitive = [];
    for (var i = 0; i < length; i++) {
      bool repeated = false;
      for (var j = 0; j < nonRepetitive.length; j++) {
        if (this[i].type == nonRepetitive[j].type &&
            this[i].density == nonRepetitive[j].density) {
          repeated = true;
        }
      }
      if (!repeated) {
        nonRepetitive.add(this[i]);
      }
    }
    return nonRepetitive;
  }

  List<BlockModel> filter_filter_type_density_color_size() {
    List<BlockModel> nonRepetitive = [];
    for (var i = 0; i < length; i++) {
      bool repeated = false;
      for (var j = 0; j < nonRepetitive.length; j++) {
        if (this[i].type == nonRepetitive[j].type &&
            this[i].density == nonRepetitive[j].density &&
            this[i].color == nonRepetitive[j].color &&
            this[i].lenth == nonRepetitive[j].lenth &&
            this[i].width == nonRepetitive[j].width &&
            this[i].hight == nonRepetitive[j].hight) {
          repeated = true;
        }
      }
      if (!repeated) {
        nonRepetitive.add(this[i]);
      }
    }
    return nonRepetitive;
  }

  List<BlockModel> filter_filter_type_density_color_size_serial() {
    List<BlockModel> nonRepetitive = [];
    for (var i = 0; i < length; i++) {
      bool repeated = false;
      for (var j = 0; j < nonRepetitive.length; j++) {
        if (this[i].type == nonRepetitive[j].type &&
            this[i].density == nonRepetitive[j].density &&
            this[i].color == nonRepetitive[j].color &&
            this[i].serial == nonRepetitive[j].serial &&
            this[i].lenth == nonRepetitive[j].lenth &&
            this[i].width == nonRepetitive[j].width &&
            this[i].hight == nonRepetitive[j].hight) {
          repeated = true;
        }
      }
      if (!repeated) {
        nonRepetitive.add(this[i]);
      }
    }
    return nonRepetitive;
  }
}
