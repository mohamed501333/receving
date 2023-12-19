// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jason_company/app/functions.dart';
import 'package:jason_company/controllers/fireStoreController.dart';
import 'package:jason_company/services/file_handle_api.dart';
import 'package:jason_company/ui/reports/reprtsForFinlProuduct/reports_viewmoder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/models/moderls.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

class FinalProductReportsview extends StatelessWidget {
  FinalProductReportsview({super.key});
  final GlobalKey<SfDataGridState> mkey = GlobalKey<SfDataGridState>();
  Future<List<int>> _readFontData() async {
    final ByteData bytes =
        await rootBundle.load("assets/fonts/HacenTunisia.ttf");
    return bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('انتاج تام الصنع'),
              IconButton(
                  onPressed: () async {
                    await createAndopenPdf(_readFontData, mkey);
                  },
                  icon: Icon(Icons.picture_as_pdf_outlined))
            ],
          ),
        ),
        body: Consumer<Firebasecontroller>(
          builder: (context, finalproducts, child) {
            const textstyle =
                TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
            return Column(
              children: [
                const Results(),
                SfDataGridTheme(
                  data: SfDataGridThemeData(
                      headerColor: const Color.fromARGB(255, 189, 233, 228)),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: SfDataGrid(
                      key: mkey,
                      source: EmployeeDataSource(
                        context: context,
                        employeeData: finalproducts.finalproducts
                            .filter_date(context)
                            .where((element) => element.improted == true)
                            .toList()
                            .filteronfinalproduct()
                            .filter_date(context),
                        finalproducts: finalproducts.finalproducts
                            .filter_date(context)
                            .where((element) => element.improted == true)
                            .toList(),
                      ),
                      columnWidthMode: ColumnWidthMode.fill,
                      columns: <GridColumn>[
                        GridColumn(
                            columnName: 'نوع',
                            label: Container(
                                padding: const EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: const Text(
                                  'نوع',
                                  style: textstyle,
                                ))),
                        GridColumn(
                            columnName: 'كثافه',
                            label: Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: const Text(
                                  'كثافه',
                                  style: textstyle,
                                ))),
                        GridColumn(
                            columnName: 'لون',
                            label: Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: const Text(
                                  'لون',
                                  style: textstyle,
                                  overflow: TextOverflow.ellipsis,
                                ))),
                        GridColumn(
                            columnName: 'عميل',
                            label: Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: const Text(
                                  'شركه',
                                  style: textstyle,
                                ))),
                        GridColumn(
                            columnName: 'كميه',
                            label: Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: const Text(
                                  'عدد',
                                  style: textstyle,
                                ))),
                        GridColumn(
                            minimumWidth: 110,
                            columnName: 'مقاس',
                            label: Container(
                                padding: const EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: const Text(
                                  'المقاس',
                                  style: textstyle,
                                ))),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

Future<void> createAndopenPdf(readFontData, GlobalKey<SfDataGridState> mkey,
    {String x = "يومية الانتاج التام "}) async {
  permission();
  var arabicFont = PdfTrueTypeFont(await readFontData(), 14);
  PdfDocument document = mkey.currentState!.exportToPdfDocument(
      headerFooterExport:
          (DataGridPdfHeaderFooterExportDetails headerFooterExport) {
    final double width = headerFooterExport.pdfPage.getClientSize().width;

    final PdfPageTemplateElement header =
        PdfPageTemplateElement(Rect.fromLTWH(0, 0, width, 65));
    header.graphics.drawString(x, arabicFont,
        bounds: const Rect.fromLTWH(0, 25, 200, 60),
        format: PdfStringFormat(textDirection: PdfTextDirection.rightToLeft));
    headerFooterExport.pdfDocumentTemplate.top = header;
  }, cellExport: (details) {
    if (details.cellType == DataGridExportCellType.columnHeader) {
      details.pdfCell.style.backgroundBrush = PdfBrushes.pink;
      details.pdfCell.style.font = arabicFont;
      details.pdfCell.stringFormat.textDirection = PdfTextDirection.rightToLeft;
    }
    if (details.cellType == DataGridExportCellType.row) {
      details.pdfCell.style.backgroundBrush = PdfBrushes.lightCyan;
      details.pdfCell.style.font = arabicFont;
      details.pdfCell.stringFormat.textDirection = PdfTextDirection.rightToLeft;
    }
  });
  final List<int> bytes = document.saveSync();
  File('/storage/emulated/0/$x.pdf')
      .writeAsBytes(bytes)
      .then((value) => FileHandleApi.openFile(value));
}

class EmployeeDataSource extends DataGridSource {
  ReportsViewModel vm = ReportsViewModel();
  BuildContext context;
  List<FinalProductModel> finalproducts;

  EmployeeDataSource(
      {required List<FinalProductModel> employeeData,
      required this.context,
      required this.finalproducts}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'نوع', value: e.type),
              DataGridCell<int>(columnName: 'كثافه', value: e.density),
              DataGridCell<String>(columnName: 'لون', value: e.color),
              DataGridCell<String>(columnName: 'عميل', value: e.company),
              DataGridCell<int>(
                  columnName: 'كميه',
                  value: vm.totalofSingleSize(e, finalproducts)),
              DataGridCell<String>(
                  columnName: 'مقاس',
                  value:
                      "${e.hight.removeTrailingZeros}*${e.width.removeTrailingZeros}*${e.lenth.removeTrailingZeros}"),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      TextStyle? getTextStyle() {
        if (e.columnName == 'كميه') {
          return const TextStyle(color: Colors.pinkAccent);
        } else {
          return null;
        }
      }

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

// جدول الاجمالى
class Results extends StatelessWidget {
  const Results({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [const HeaderOftable22(), TheTable23()],
      ),
    );
  }
}

class HeaderOftable22 extends StatelessWidget {
  const HeaderOftable22({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Table(
        columnWidths: const {
          3: FlexColumnWidth(1),
          1: FlexColumnWidth(.3),
          0: FlexColumnWidth(.3),
          2: FlexColumnWidth(.3),
        },
        border: TableBorder.all(width: 1, color: Colors.black),
        children: [
          TableRow(
              decoration: BoxDecoration(
                color: Colors.amber[50],
              ),
              children: [
                Container(
                    padding: const EdgeInsets.all(4), child: const Text("م")),
                Container(
                    padding: const EdgeInsets.all(4),
                    child: const Text("كثافه")),
                Container(
                    padding: const EdgeInsets.all(4),
                    child: const Center(child: Text('نوع'))),
                Container(
                    padding: const EdgeInsets.all(4),
                    child: const Text('اجمالى وارد مخزن منتج تام')),
              ])
        ],
      ),
    );
  }
}

class TheTable23 extends StatelessWidget {
  TheTable23({
    super.key,
  });
  ReportsViewModel vm = ReportsViewModel();
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<Firebasecontroller>(
      builder: (context, finalproducts, child) {
        return Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Table(
              columnWidths: const {
                3: FlexColumnWidth(1),
                1: FlexColumnWidth(.3),
                0: FlexColumnWidth(.3),
                2: FlexColumnWidth(.3),
              },
              children: finalproducts.finalproducts
                  .filter_date(context)
                  .where((element) => element.improted == true)
                  .toList()
                  .filter_type_density()
                  .map((e) {
                x++;

                return TableRow(
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.all(4), child: Text("$x")),
                      Container(
                          padding: const EdgeInsets.all(4),
                          child: Text(e.density.toString())),
                      Container(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            e.type,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 221, 2, 75)),
                          )),
                      Container(
                          padding: const EdgeInsets.all(4),
                          child: Text(vm
                              .total_finalprodut(
                                  finalproducts.finalproducts
                                      .filter_date(context)
                                      .where(
                                          (element) => element.improted == true)
                                      .toList(),
                                  e)
                              .toStringAsFixed(4)
                              .toString())),
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
