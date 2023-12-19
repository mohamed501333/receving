// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/controllers/blockFirebaseController.dart';
import 'package:jason_company/models/moderls.dart';
import 'package:jason_company/ui/reports/reportsForBlock/Bolck_reports_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class HeaderOftable4 extends StatelessWidget {
  const HeaderOftable4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(.6),
        4: FlexColumnWidth(.7),
      },
      border: TableBorder.all(width: 1, color: Colors.black),
      children: [
        TableRow(
            decoration: BoxDecoration(
              color: Colors.amber[50],
            ),
            children: [
              Container(
                  padding: const EdgeInsets.all(4),
                  child: const Text("اجمالى المنصرف")),
              Container(
                  padding: const EdgeInsets.all(4),
                  child: const Text("رصيد اخر المده")),
              Container(
                  padding: const EdgeInsets.all(0),
                  child: const Text('رصيد اول المده')),
              Container(
                  padding: const EdgeInsets.all(0), child: const Text('كثافه')),
              Container(
                  padding: const EdgeInsets.all(0), child: const Text('النوع')),
            ])
      ],
    );
  }
}

class TheTable2 extends StatelessWidget {
  TheTable2({
    super.key,
  });
  BlockReportsViewModel vm = BlockReportsViewModel();
  @override
  Widget build(BuildContext context) {
    return Consumer<BlockFirebasecontroller>(
      builder: (context, blocks, child) {
        return Table(
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
            3: FlexColumnWidth(.6),
            4: FlexColumnWidth(.7),
          },
          children: blocks.blocks
              .filter_date(context)
              .filter_filter_type_and_density()
              .map((e) {
            return TableRow(
                decoration: BoxDecoration(
                  color: 2 % 2 == 0 ? Colors.teal[50] : Colors.amber[50],
                ),
                children: [
                  Container(
                      padding: const EdgeInsets.all(2),
                      child: Text(vm
                          .total_spend(blocks.blocks.filter_date(context), e)
                          .toStringAsFixed(4))),
                  Container(
                      padding: const EdgeInsets.all(2),
                      child: Text(vm.Last_period_balance(
                              blocks.blocks.filter_date(context), e)
                          .toStringAsFixed(4))),
                  Container(
                      padding: const EdgeInsets.all(1),
                      child: Text((vm.Last_period_balance(
                                  blocks.blocks.filter_date(context), e) +
                              vm.total_spend(
                                  blocks.blocks.filter_date(context), e))
                          .toStringAsFixed(4))),
                  Container(
                      padding: const EdgeInsets.all(0),
                      child: Text(e.density.toString())),
                  Container(
                      padding: const EdgeInsets.all(0), child: Text(e.type)),
                ]);
          }).toList(),
          border: TableBorder.all(width: 1, color: Colors.black),
        );
      },
    );
  }
}

class BlockStockInventory extends StatelessWidget {
  const BlockStockInventory({super.key});

  @override
  Widget build(BuildContext context) {
    const textstyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
    var columns = <GridColumn>[
      GridColumn(
          columnName: 'amount',
          label: Container(
              alignment: Alignment.center,
              child: const Text(
                'عدد',
                style: textstyle,
              ))),
      GridColumn(
          minimumWidth: 110,
          columnName: 'size',
          label: Container(
              padding: const EdgeInsets.all(4),
              alignment: Alignment.center,
              child: const Text(
                'المقاس',
                style: textstyle,
              ))),
      GridColumn(
          columnName: 'color',
          label: Container(
              alignment: Alignment.center,
              child: const Text(
                'لون',
                style: textstyle,
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'denety',
          label: Container(
              alignment: Alignment.center,
              child: const Text(
                'كثافه',
                style: textstyle,
              ))),
      GridColumn(
          columnName: 'type',
          label: Container(
              padding: const EdgeInsets.all(4.0),
              alignment: Alignment.center,
              child: const Text(
                'نوع',
                style: textstyle,
              ))),
    ];
    return Consumer<BlockFirebasecontroller>(
      builder: (context, blocks, child) {
        return SfDataGridTheme(
          data: SfDataGridThemeData(
              headerColor: const Color.fromARGB(255, 189, 233, 228)),
          child: SfDataGrid(
            allowSorting: true,
            allowMultiColumnSorting: true,
            allowTriStateSorting: true,
            source: EmployeeDataSource(
                coumingData: blocks.blocks.filter_date(context)),
            columnWidthMode: ColumnWidthMode.fill,
            columns: columns,
          ),
        );
      },
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  BlockReportsViewModel vm = BlockReportsViewModel();
//DataGridRowهنا تحويل البيانات الى قائمه من
  EmployeeDataSource({
    required List<BlockModel> coumingData,
  }) {
    data = coumingData
        .filter_filter_type_density_color_size()
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: 'amount',
                  value: vm.total_amount_for_single_siz__(e, coumingData)),
              DataGridCell<String>(
                  columnName: 'size',
                  value: "${e.hight}*${e.width}*${e.lenth}"),
              DataGridCell<String>(columnName: 'color', value: e.color),
              DataGridCell<int>(columnName: 'denety', value: e.density),
              DataGridCell<String>(columnName: 'type', value: e.type),
            ]))
        .toList();
  }

  List<DataGridRow> data = [];

  @override
  List<DataGridRow> get rows => data;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      //انشاء ستايل ل بيانات الخلايا
      TextStyle? getTextStyle() {
        if (e.columnName == 'amount') {
          return const TextStyle(color: Colors.pinkAccent);
        } else {
          return null;
        }
      }

      //هنا الخلايا
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4.0),
        child: Text(
          e.value.toString(),
          style: getTextStyle(),
        ),
      );
    }).toList());
  }
}
