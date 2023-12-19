// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:objectbox/objectbox.dart';

@Entity()
class BlockModel {
  @Id()
  int id = 0;
  String color;
  int density;
  String type;
  int serial;
  int number;
  @Property(type: PropertyType.date)
  DateTime time;
  int scissor;
  int width;
  int lenth;
  int hight;
  bool isfineshed;
  bool consumed;

  BlockModel({
    this.isfineshed = false,
    this.consumed = false,
    this.id = 0,
    required this.color,
    required this.density,
    required this.type,
    required this.serial,
    required this.number,
    required this.time,
    required this.width,
    required this.lenth,
    required this.hight,
    this.scissor = 0,
  });

  //  horizontalscissor

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color,
      'density': density,
      'type': type,
      'serial': serial,
      'number': number,
      'time': time.millisecondsSinceEpoch,
      'scissor': scissor,
      'width': width,
      'lenth': lenth,
      'hight': hight,
      'isfineshed': isfineshed,
      'consumed': consumed,
    };
  }

  factory BlockModel.fromMap(Map<String, dynamic> map) {
    return BlockModel(
      id: map['id'] as int,
      color: map['color'] as String,
      density: map['density'] as int,
      type: map['type'] as String,
      serial: map['serial'] as int,
      number: map['number'] as int,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      scissor: map['scissor'] as int,
      width: map['width'] as int,
      lenth: map['lenth'] as int,
      hight: map['hight'] as int,
      isfineshed: map['isfineshed'] as bool,
      consumed: map['consumed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory BlockModel.fromJson(String source) =>
      BlockModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// the relation is many fraction to one block

@Entity()
class FractionModel {
  @Id()
  int id;
  int blockmodelmum;
  int wedth;
  int lenth;
  int hight;
  bool isfineshed;
  int density;
  String type;
  int serial;
  int hscissor;
  int rscissor;
  String color;

  @Property(type: PropertyType.date)
  DateTime time;
  @Property(type: PropertyType.date)
  DateTime timeofRscissor;

  FractionModel({
    this.id = 0,
    required this.timeofRscissor,
    required this.blockmodelmum,
    required this.wedth,
    required this.lenth,
    required this.hight,
    this.isfineshed = false,
    required this.density,
    required this.type,
    required this.serial,
    required this.hscissor,
    this.rscissor = 0,
    required this.color,
    required this.time,
  });

// scissor
}

// many finalProuduct to many fractoin
@Entity()
class FinalProductModel {
  @Id()
  int id = 0;
  String color;
  int density;
  String type;
  int amount;
  @Property(type: PropertyType.date)
  DateTime time;
  @Property(type: PropertyType.date)
  DateTime timeofOut;
  int scissor;
  double width;
  double lenth;
  double hight;
  String company;
  bool improted;
  FinalProductModel({
    this.id = 0,
    required this.color,
    required this.density,
    required this.type,
    required this.amount,
    required this.time,
    required this.timeofOut,
    required this.scissor,
    required this.width,
    required this.lenth,
    required this.hight,
    required this.company,
    this.improted = true,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color,
      'density': density,
      'type': type,
      'amount': amount,
      'time': time.millisecondsSinceEpoch,
      'timeofOut': timeofOut.millisecondsSinceEpoch,
      'scissor': scissor,
      'width': width,
      'lenth': lenth,
      'hight': hight,
      'company': company,
      'improted': improted,
    };
  }

  factory FinalProductModel.fromMap(Map<String, dynamic> map) {
    return FinalProductModel(
      id: map['id'] as int,
      color: map['color'] as String,
      density: map['density'] as int,
      type: map['type'] as String,
      amount: map['amount'] as int,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      timeofOut: DateTime.fromMillisecondsSinceEpoch(map['timeofOut'] as int),
      scissor: map['scissor'] as int,
      width: map['width'] as double,
      lenth: map['lenth'] as double,
      hight: map['hight'] as double,
      company: map['company'] as String,
      improted: map['improted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FinalProductModel.fromJson(String source) =>
      FinalProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

@Entity()
class ChipBlockModel {
  @Id()
  int id;
  final String title;
  final String color;
  final double density;
  final String type;
  final double serial;
  final double number;
  final double width;
  final double lenth;
  final double scissor;
  final double hight;

  ChipBlockModel({
    this.id = 0,
    required this.title,
    required this.scissor,
    required this.color,
    required this.density,
    required this.type,
    required this.serial,
    required this.number,
    required this.width,
    required this.lenth,
    required this.hight,
  });
}

@Entity()
class ChipFraction {
  @Id()
  int id;
  final double width;
  final double lenth;
  final double hight;

  ChipFraction(
      {this.id = 0,
      required this.width,
      required this.lenth,
      required this.hight});
}

@Entity()
class ChipfinalProducut {
  @Id()
  int id = 0;
  String title;
  String color;
  double density;
  String type;
  double amount;
  double number;
  double width;
  double lenth;
  double hight;
  String company;
  String scissor;

  ChipfinalProducut({
    this.id = 0,
    required this.title,
    required this.scissor,
    required this.color,
    required this.density,
    required this.type,
    required this.amount,
    required this.number,
    required this.width,
    required this.lenth,
    required this.hight,
    required this.company,
  });
}

class CuttingOrderModel {
  int id;
  String color;
  String type;
  int density;
  String customer;
  bool cutted;
  bool recived;
  bool quality;
  bool out;
  int hight;
  int wedth;
  int lenth;
  int amonunt;
  DateTime date;
  DateTime datecutted;
  DateTime daterecieved;
  DateTime datequality;
  CuttingOrderModel({
    required this.id,
    required this.color,
    required this.type,
    required this.density,
    required this.customer,
    this.cutted = false,
    this.recived = false,
    this.quality = false,
    this.out = false,
    required this.hight,
    required this.wedth,
    required this.lenth,
    required this.amonunt,
    required this.date,
    required this.datecutted,
    required this.daterecieved,
    required this.datequality,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color,
      'type': type,
      'density': density,
      'customer': customer,
      'cutted': cutted,
      'recived': recived,
      'quality': quality,
      'out': out,
      'hight': hight,
      'wedth': wedth,
      'lenth': lenth,
      'amonunt': amonunt,
      'date': date.millisecondsSinceEpoch,
      'datecutted': datecutted.millisecondsSinceEpoch,
      'daterecieved': daterecieved.millisecondsSinceEpoch,
      'datequality': datequality.millisecondsSinceEpoch,
    };
  }

  factory CuttingOrderModel.fromMap(Map<String, dynamic> map) {
    return CuttingOrderModel(
      id: map['id'] as int,
      color: map['color'] as String,
      type: map['type'] as String,
      density: map['density'] as int,
      customer: map['customer'] as String,
      cutted: map['cutted'] as bool,
      recived: map['recived'] as bool,
      quality: map['quality'] as bool,
      out: map['out'] as bool,
      hight: map['hight'] as int,
      wedth: map['wedth'] as int,
      lenth: map['lenth'] as int,
      amonunt: map['amonunt'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      datecutted: DateTime.fromMillisecondsSinceEpoch(map['datecutted'] as int),
      daterecieved:
          DateTime.fromMillisecondsSinceEpoch(map['daterecieved'] as int),
      datequality:
          DateTime.fromMillisecondsSinceEpoch(map['datequality'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CuttingOrderModel.fromJson(String source) =>
      CuttingOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CuttingOrderModel(id: $id, color: $color, type: $type, density: $density, customer: $customer, cutted: $cutted, recived: $recived, quality: $quality, out: $out, hight: $hight, wedth: $wedth, lenth: $lenth, amonunt: $amonunt, date: $date, datecutted: $datecutted, daterecieved: $daterecieved, datequality: $datequality)';
  }

  @override
  bool operator ==(covariant CuttingOrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.color == color &&
        other.type == type &&
        other.density == density &&
        other.customer == customer &&
        other.cutted == cutted &&
        other.recived == recived &&
        other.quality == quality &&
        other.out == out &&
        other.hight == hight &&
        other.wedth == wedth &&
        other.lenth == lenth &&
        other.amonunt == amonunt &&
        other.date == date &&
        other.datecutted == datecutted &&
        other.daterecieved == daterecieved &&
        other.datequality == datequality;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        color.hashCode ^
        type.hashCode ^
        density.hashCode ^
        customer.hashCode ^
        cutted.hashCode ^
        recived.hashCode ^
        quality.hashCode ^
        out.hashCode ^
        hight.hashCode ^
        wedth.hashCode ^
        lenth.hashCode ^
        amonunt.hashCode ^
        date.hashCode ^
        datecutted.hashCode ^
        daterecieved.hashCode ^
        datequality.hashCode;
  }

  CuttingOrderModel copyWith({
    int? id,
    String? color,
    String? type,
    int? density,
    String? customer,
    bool? cutted,
    bool? recived,
    bool? quality,
    bool? out,
    int? hight,
    int? wedth,
    int? lenth,
    int? amonunt,
    DateTime? date,
    DateTime? datecutted,
    DateTime? daterecieved,
    DateTime? datequality,
  }) {
    return CuttingOrderModel(
      id: id ?? this.id,
      color: color ?? this.color,
      type: type ?? this.type,
      density: density ?? this.density,
      customer: customer ?? this.customer,
      cutted: cutted ?? this.cutted,
      recived: recived ?? this.recived,
      quality: quality ?? this.quality,
      out: out ?? this.out,
      hight: hight ?? this.hight,
      wedth: wedth ?? this.wedth,
      lenth: lenth ?? this.lenth,
      amonunt: amonunt ?? this.amonunt,
      date: date ?? this.date,
      datecutted: datecutted ?? this.datecutted,
      daterecieved: daterecieved ?? this.daterecieved,
      datequality: datequality ?? this.datequality,
    );
  }
}
