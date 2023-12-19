import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jason_company/models/moderls.dart';

class BlockFirebasecontroller extends ChangeNotifier {
  stream() {
    try {
      FirebaseFirestore.instance
          .collection('blocks')
          .orderBy("time")
          .snapshots()
          .listen((event) {
        blocks.clear();
        blocks.addAll(
            event.docs.map((doc) => BlockModel.fromMap(doc.data())).toList());
        notifyListeners();

        print("snapshot");
      });
    } catch (e) {
      print(e);
      print("jkjk");
    }
  }

  List<BlockModel> blocks = [];

  addblock(BlockModel blocks) async {
    try {
      await FirebaseFirestore.instance.collection('blocks').add(blocks.toMap());
    } catch (e) {
      print(e);
      print("add");
    }
  }

  deleteblock(id) {
    try {
      FirebaseFirestore.instance
          .collection('blocks')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference.delete();
              }));
    } catch (e) {
      print(e);
    }
  }

  consumeblock(id) {
    try {
      FirebaseFirestore.instance
          .collection('blocks')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference.update({"consumed": true});
              }));
    } catch (e) {
      print(e);
    }
  }

  unconsumeblock(id) {
    try {
      FirebaseFirestore.instance
          .collection('blocks')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference.update({"consumed": false});
              }));
    } catch (e) {
      print(e);
    }
  }

  finishblock(id, scissor) {
    try {
      FirebaseFirestore.instance
          .collection('blocks')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference
                    .update({"isfineshed": true, "scissor": scissor});
              }));
    } catch (e) {
      print(e);
    }
  }

  unfinishblock(id) {
    try {
      FirebaseFirestore.instance
          .collection('blocks')
          .where('id', isEqualTo: id)
          .get()
          .then((value) => value.docs.forEach((element) {
                element.reference.update({"isfineshed": false, "scissor": 0});
              }));
    } catch (e) {
      print(e);
    }
  }
}
