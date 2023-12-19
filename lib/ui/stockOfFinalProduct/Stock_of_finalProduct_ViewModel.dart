// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/controllers/fireStoreController.dart';
import 'package:jason_company/models/moderls.dart';
import 'package:jason_company/ui/base/base_view_mode.dart';
import 'package:provider/provider.dart';

class stockOfFinalProductsViewModel extends BaseViewModel {
  //ارجاع قائمه باسم الشركه والمقاسات الموجوده بها
  List<GroupModel> source(List<FinalProductModel> finalproducts) {
    var x = finalproducts;
    return x
        .filter_company()
        .map((e) => GroupModel(
            name: e.company,
            items: x
                .where((element) => element.company == e.company)
                .toList()
                .filter_density_type_size()
                .map((e) => ItemModel(e.density, e.type, e.lenth, e.width,
                    e.hight, get_total(finalproducts, e), e.company))
                .toList()))
        .toList();
  }

//ارجاع اجمالى العدد لكل مقاس
  get_total(List<FinalProductModel> finalproducts, e) {
    return finalproducts
        .where((element) =>
            element.density == e.density &&
            element.company == e.company &&
            element.type == e.type &&
            element.width == e.width &&
            element.hight == e.hight &&
            element.lenth == e.lenth)
        .map((e) => e.amount)
        .reduce((a, b) => a + b);
  }

  incertfinalProduct(BuildContext context) {
    context.read<Firebasecontroller>().addfinalProduct(FinalProductModel(
        color: "",
        density: int.parse(densitycontroller.text),
        type: typecontroller.text,
        improted: false,
        amount: int.parse(amountcontroller.text),
        time: DateTime.now(),
        scissor: int.tryParse(scissorcontroller.text) ?? 0,
        width: double.parse(widthcontroller.text),
        lenth: double.parse(lenthcontroller.text),
        hight: double.parse(hightncontroller.text),
        company: companycontroller.text,
        timeofOut: DateTime.parse("2001-01-01")));
  }

  void add(BuildContext context) {
    if (formKey.currentState!.validate()) {
      incertfinalProduct(context);
      clearfields();
    }
  }

//الخاصه بالاضافه الى هذا المقاس
  void addtocertinsize(
      BuildContext context, ItemModel itemData, GroupModel headerData) {
    if (formKey.currentState!.validate() && itemData.total > 0) {
      context.read<Firebasecontroller>().addfinalProduct(FinalProductModel(
          color: "",
          density: itemData.density,
          type: itemData.type,
          improted: false,
          amount: int.parse(amountcontroller.text),
          time: DateTime.now(),
          scissor: int.tryParse(scissorcontroller.text) ?? 0,
          width: itemData.width,
          lenth: itemData.lenth,
          hight: itemData.hight,
          company: headerData.name,
          timeofOut: DateTime.parse("2001-01-01")));
      clearfields();
    }
  }
}

class GroupModel {
  final String name;
  final List<ItemModel> items;
  GroupModel({required this.name, required this.items});
}

class ItemModel {
  final int density;
  final String type;
  final String company;
  final double lenth;
  final double width;
  final double hight;
  final int total;
  ItemModel(
    this.density,
    this.type,
    this.lenth,
    this.width,
    this.hight,
    this.total,
    this.company,
  );
}
