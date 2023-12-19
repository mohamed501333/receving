// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:jason_company/ui/reports/reportsForBlock/W.dart';

class BlockReportsView extends StatelessWidget {
  const BlockReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("يومية البلوكات"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const HeaderOftable4(),
          TheTable2(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 60,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              child: const Center(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "جرد مخزن البلوك",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_downward),
                          Icon(Icons.arrow_downward),
                          Icon(Icons.arrow_downward),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          //جرد مخزن البلوك
          const BlockStockInventory()
        ],
      ),
    );
  }
}
