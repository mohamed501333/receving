// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jason_company/controllers/cutting_order_controller.dart';
import 'package:provider/provider.dart';

import 'package:jason_company/ui/cutting_order/cutting_ordera_viewModer.dart';

class TheTable001 extends StatelessWidget {
  TheTable001({
    Key? key,
    required this.vm,
  }) : super(key: key);

  final CuttingOrderViewModel vm;
  @override
  Widget build(BuildContext context) {
    return Consumer<Cutting_Order_controller>(
      builder: (context, cuttingorders, child) {
        int x = 0;

        return Expanded(
          flex: 4,
          child: SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 700,
              child: ListView(
                children: [
                  const HeaderOftable001(),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(3),
                      2: FlexColumnWidth(3),
                      3: FlexColumnWidth(3),
                      4: FlexColumnWidth(1.3),
                      5: FlexColumnWidth(1.3),
                      6: FlexColumnWidth(1),
                      7: FlexColumnWidth(1.2),
                      8: FlexColumnWidth(3),
                      9: FlexColumnWidth(1),
                    },
                    children: cuttingorders.cuttingOrders
                        .where((element) =>
                            element.cutted == false ||
                            element.quality == false ||
                            element.recived == false)
                        .map((user) {
                          x++;
                          return TableRow(
                              decoration: BoxDecoration(
                                color:
                                    cuttingorders.cuttingOrders.indexOf(user) %
                                                2 ==
                                            0
                                        ? Colors.blue[50]
                                        : Colors.amber[50],
                              ),
                              children: [
                                //تم التحميل
                                Container(
                                    height: 44,
                                    padding: const EdgeInsets.all(2),
                                    child: Row(
                                      children: [
                                        Icon(user.out == true
                                            ? Icons.check
                                            : Icons.close),
                                      ],
                                    )),
                                //تم الاستلام
                                GestureDetector(
                                  onTap: () => user.recived == false &&
                                          user.cutted == true
                                      ? showAlertDialog(
                                          context, vm, user.id, "r")
                                      : DoNothingAction(),
                                  child: Container(
                                      padding: const EdgeInsets.all(2),
                                      child: Column(
                                        children: [
                                          Icon(user.recived == true
                                              ? Icons.check
                                              : Icons.close),
                                          user.cutted == true
                                              ? Text(
                                                  DateFormat('dd-MM-yy/hh:mm a')
                                                      .format(user.daterecieved)
                                                      .toString()
                                                      .toString()
                                                      .toString())
                                              : const SizedBox()
                                        ],
                                      )),
                                ),
                                //الجوده
                                GestureDetector(
                                  onTap: () => user.quality == false &&
                                          user.cutted == true
                                      ? showAlertDialog(
                                          context, vm, user.id, "q")
                                      : DoNothingAction(),
                                  child: Container(
                                      padding: const EdgeInsets.all(2),
                                      child: Column(
                                        children: [
                                          Icon(user.quality == true
                                              ? Icons.check
                                              : Icons.close),
                                          user.cutted == true
                                              ? Text(
                                                  DateFormat('dd-MM-yy/hh:mm a')
                                                      .format(user.datequality)
                                                      .toString()
                                                      .toString()
                                                      .toString())
                                              : const SizedBox()
                                        ],
                                      )),
                                ),
                                //التقطيع
                                Container(
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      children: [
                                        Icon(user.cutted == true
                                            ? Icons.check
                                            : Icons.close),
                                        user.cutted == true
                                            ? Text(
                                                DateFormat('dd-MM-yy/hh:mm a')
                                                    .format(user.datecutted)
                                                    .toString()
                                                    .toString()
                                                    .toString())
                                            : const SizedBox()
                                      ],
                                    )),
                                Container(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(user.customer.toString(),
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600))),
                                Container(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      user.type.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )),
                                Container(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(user.density.toString())),
                                Container(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(user.amonunt.toString())),
                                Container(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                        "${user.hight}*${user.wedth}*${user.lenth}")),
                                Container(
                                    padding: const EdgeInsets.all(2),
                                    child: Text("${x}")),
                              ]);
                        })
                        .toList()
                        .reversed
                        .toList(),
                    border: TableBorder.all(width: 1, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class HeaderOftable001 extends StatelessWidget {
  const HeaderOftable001({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(3),
        3: FlexColumnWidth(3),
        4: FlexColumnWidth(1.3),
        5: FlexColumnWidth(1.3),
        6: FlexColumnWidth(1),
        7: FlexColumnWidth(1.2),
        8: FlexColumnWidth(3),
        9: FlexColumnWidth(1),
      },
      border: TableBorder.all(width: 1, color: Colors.black),
      children: [
        TableRow(
            decoration: BoxDecoration(
              color: Colors.amber[50],
            ),
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  child: const Text("تم التحميل ")),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: const Text("تم الاستلام")),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: const Text("تم الجوده")),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: const Text("تم التصنيع")),
              Container(
                  padding: const EdgeInsets.all(4), child: const Text('عميل')),
              Container(
                  padding: const EdgeInsets.all(4),
                  child: const Text('نوع',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold))),
              Container(
                  padding: const EdgeInsets.all(4),
                  child: const Text('كثافه',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold))),
              Container(
                  padding: const EdgeInsets.all(4),
                  child: const Text('كمية',
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold))),
              Container(
                  padding: const EdgeInsets.all(4),
                  child: const Center(child: Text('مقاس'))),
              Container(
                  padding: const EdgeInsets.all(4), child: const Text('رقم')),
            ])
      ],
    );
  }
}

showAlertDialog(
    BuildContext context, CuttingOrderViewModel vm, id, String casefun) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('  ?'),
          content: const Text('هل تم تصنيع هذا المقاس؟'),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  switch (casefun) {
                    case "c":
                      vm.cutted(context, id);
                      break;
                    case "r":
                      vm.received(context, id);
                      break;
                    case "q":
                      vm.quality(context, id);
                      break;
                  }
                  Navigator.pop(context);
                },
                child: const Text(
                  'yes',
                )),
          ],
        );
      });
}
