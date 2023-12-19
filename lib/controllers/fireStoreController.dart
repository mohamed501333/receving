// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jason_company/models/moderls.dart';

class Firebasecontroller extends ChangeNotifier {
  stream() {
    try {
      FirebaseFirestore.instance
          .collection('finalProduct')
          .orderBy("time")
          .snapshots()
          .listen((event) {
        finalproducts.clear();
        finalproducts.addAll(event.docs
            .map((doc) => FinalProductModel.fromMap(doc.data()))
            .toList());
        notifyListeners();

        print("snapshot");
      });
    } catch (e) {
      print(e);
      print("jkjk");
    }
  }

  List<FinalProductModel> finalproducts = [];

  addfinalProduct(FinalProductModel finalproduct) async {
    try {
      await FirebaseFirestore.instance
          .collection('finalProduct')
          .add(finalproduct.toMap());
    } catch (e) {
      print(e);
      print("add");
    }
  }

  deletefinalProudut(id) {
    try {
      FirebaseFirestore.instance
          .collection('finalProduct')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference.delete();
              }));
    } catch (e) {
      print(e);
    }
  }
}
