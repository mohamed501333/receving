// ignore_for_file: file_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jason_company/models/moderls.dart';

class Cutting_Order_controller extends ChangeNotifier {
  stream() {
    try {
      FirebaseFirestore.instance
          .collection("cuttingOrder")
          .orderBy("date")
          .snapshots()
          .listen((event) {
        cuttingOrders.clear();
        cuttingOrders.addAll(event.docs
            .map((doc) => CuttingOrderModel.fromMap(doc.data()))
            .toList());
        notifyListeners();
        print("snapshot");
      });
    } catch (e) {
      print(e);
      print("jkjk");
    }
  }

  List<CuttingOrderModel> cuttingOrders = [];

  addcuttingOrder(CuttingOrderModel cuttingorder) async {
    try {
      await FirebaseFirestore.instance
          .collection("cuttingOrder")
          .add(cuttingorder.toMap());
    } catch (e) {
      print(e);
      print("add");
    }
  }

  deletecuttingOrder(id) {
    try {
      FirebaseFirestore.instance
          .collection('cuttingOrder')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference.delete();
              }));
    } catch (e) {
      print(e);
    }
  }

  cutted(id) {
    try {
      FirebaseFirestore.instance
          .collection('cuttingOrder')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference.update({
                  "cutted": true,
                  "datecutted": DateTime.now().millisecondsSinceEpoch
                });
              }));
    } catch (e) {
      print(e);
    }
  }

  recived(id) {
    try {
      FirebaseFirestore.instance
          .collection('cuttingOrder')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference.update({
                  "recived": true,
                  "daterecieved": DateTime.now().millisecondsSinceEpoch
                });
              }));
    } catch (e) {
      print(e);
    }
  }

  quality(id) {
    try {
      FirebaseFirestore.instance
          .collection('cuttingOrder')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference.update({
                  "quality": true,
                  "datecutted": DateTime.now().millisecondsSinceEpoch
                });
              }));
    } catch (e) {
      print(e);
    }
  }
}
