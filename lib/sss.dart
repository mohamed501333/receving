// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jason_company/models/moderls.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('blocks').snapshots();

  @override
  Widget build(BuildContext context) {
    int x = 0;
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Table(
              columnWidths: const {
                1: FlexColumnWidth(1.4),
                2: FlexColumnWidth(.6),
                3: FlexColumnWidth(.7),
                4: FlexColumnWidth(.5),
                6: FlexColumnWidth(2.3),
                7: FlexColumnWidth(.9),
                8: FlexColumnWidth(.7),
              },
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                x++;
                BlockModel data = BlockModel.fromMap(
                    document.data()! as Map<String, dynamic>);

                return TableRow(
                    decoration: BoxDecoration(
                      color: x % 2 == 0 ? Colors.blue[50] : Colors.amber[50],
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.all(4),
                          child: GestureDetector(
                              onTap: () {
                                // vm.deleteblock(context, user.id);
                                // vm.delete_fraction_of_certin_block(user);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))),
                      Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            data.serial.toString(),
                            style: const TextStyle(fontSize: 14),
                          )),
                      Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(data.type.toString(),
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600))),
                      Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            data.density.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )),
                      Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(data.scissor.toString())),
                      Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(data.color.toString())),
                      Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                              "${data.hight}*${data.width}*${data.lenth}")),
                      Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            data.number.toString(),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 221, 2, 75)),
                          )),
                      Container(
                          padding: const EdgeInsets.all(2), child: Text("$x")),
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
