// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, file_names, non_constant_identifier_names
// ignore_for_file: library_private_types_in_public_api, unused_local_variable
import 'package:flutter/material.dart';
import 'package:jason_company/controllers/blockFirebaseController.dart';
import 'package:jason_company/models/moderls.dart';
import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/app/functions.dart';
import 'package:jason_company/main.dart';
import 'package:jason_company/services/file_handle_api.dart';
import 'package:jason_company/services/pdf_invoice_api.dart';
import 'package:jason_company/services/pdfprevei.dart';
import 'package:jason_company/setings/login.dart';
import 'package:jason_company/ui/commen/date.dart';
import 'package:jason_company/ui/reports/reportsforH/h_reports_viewModel.dart';
import 'package:provider/provider.dart';

class Setings extends StatelessWidget {
  Setings({super.key});
  HReportsViewModel vm1 = HReportsViewModel();
  HReportsViewModel vm2 = HReportsViewModel();

  @override
  Widget build(BuildContext context) {
    var blocks = context.read<BlockFirebasecontroller>().blocks;
    List<FractionModel> fractions = database.getFraction();
    Hdata(scissor) => blocks
        .filter_date(context)
        .where((e) => e.scissor == scissor)
        .toList()
        .filter_filter_type_density_color_size_serial()
        .map((e) => PdfHScissors(
              serial: e.serial,
              type: e.type,
              density: e.density,
              color: e.color,
              width: e.width,
              lenth: e.lenth,
              hight: e.hight,
              amount: vm1.total_amount_for_single_siz__(e, blocks, scissor),
            ))
        .toList();
    results(scissor) => fractions
        .filter_date(context)
        .where((element) => element.hscissor == scissor)
        .toList()
        .filter_Fractios___()
        .map((e) => Results(
            lenth: e.lenth,
            hight: e.hight,
            width: e.wedth,
            amount: vm2.total_amount_for_single_siz__fractions(
                e, fractions, scissor)))
        .toList();
    PdfHscissorsdata data =
        PdfHscissorsdata(h1: Hdata(1), h2: Hdata(2), h3: Hdata(3));
    ResultsData resultsdata =
        ResultsData(h1: results(1), h2: results(2), h3: results(3));
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              color: const Color.fromARGB(255, 212, 205, 205),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Date(),
              Text(
                'توقيت البرنامج',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 8.0),
            child: Text(
              ' PDF عرض اليوميه ك ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          onPressed: () async {
            permission().then((value) async {
              PdfInvoiceApi.generate(context,
                      hscissors: data, resltsdata: resultsdata)
                  .then((value) => context.gonext(PDfpreview(
                        v: value.save(),
                      )));
            });
          },
        ),
        ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 8.0),
            child: Text(
              ' PDF انشاء اليوميه ك ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          onPressed: () async {
            permission().then((value) async {
              PdfInvoiceApi.generate(context,
                      hscissors: PdfHscissorsdata(
                          h1: Hdata(1), h2: Hdata(1), h3: Hdata(1)),
                      resltsdata: resultsdata)
                  .then((value) => FileHandleApi.saveDocument(pdf: value))
                  .then((value) => FileHandleApi.openFile(value));
            });
          },
        ),
        ElevatedButton(
            onPressed: () {
              context.gonext(const MyloginPage());
            },
            child: const Text("تسجيل الدخول"))
      ],
    ));
  }
}

class ResultsData {
  List<Results> h1;
  List<Results> h2;
  List<Results> h3;
  ResultsData({
    required this.h1,
    required this.h2,
    required this.h3,
  });
}

class PdfHscissorsdata {
  List<PdfHScissors> h1;
  List<PdfHScissors> h2;
  List<PdfHScissors> h3;
  PdfHscissorsdata({
    required this.h1,
    required this.h2,
    required this.h3,
  });
}

class PdfHScissors {
  int serial;
  String type;
  int density;
  String color;
  int width;
  int lenth;
  int hight;
  int amount;
  PdfHScissors({
    required this.serial,
    required this.type,
    required this.density,
    required this.color,
    required this.width,
    required this.lenth,
    required this.hight,
    required this.amount,
  });
}

class Results {
  int lenth;
  int hight;
  int width;
  int amount;
  Results({
    required this.lenth,
    required this.hight,
    required this.width,
    required this.amount,
  });
}
