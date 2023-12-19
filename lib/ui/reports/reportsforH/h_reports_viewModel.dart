// ignore_for_file: non_constant_identifier_names, file_names

import 'package:jason_company/models/moderls.dart';

class HReportsViewModel {
  int total_amount_for_single_siz__(
      BlockModel e, List<BlockModel> blocks, int scissor) {
    return blocks
        .where(
          (f) =>
              f.scissor == scissor &&
              e.color == f.color &&
              e.density == f.density &&
              e.serial == f.serial &&
              e.hight == f.hight &&
              e.width == f.width &&
              e.lenth == f.lenth &&
              e.type == f.type,
        )
        .toList()
        .length;
  }

  int total_amount_for_single_siz__fractions(
      FractionModel e, List<FractionModel> fractions, int scissor) {
    return fractions
        .where(
          (f) =>
              f.hscissor == scissor &&
              e.color == f.color &&
              e.density == f.density &&
              e.serial == f.serial &&
              e.hight == f.hight &&
              e.wedth == f.wedth &&
              e.lenth == f.lenth &&
              e.type == f.type,
        )
        .toList()
        .length;
  }
}
