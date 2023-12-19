// ignore: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: non_constant_identifier_names
getDates_between_tow_dates(DateTime startDate, DateTime endDate) {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  getDaysInBetween() {
    final int difference = startDate.difference(endDate).inDays;
    return 1 + difference;
  }

  final List<DateTime> items = List.generate(getDaysInBetween(), (i) {
    DateTime date = endDate;

    return date.add(Duration(days: i));
  });

  return items;
}

pickDateTimeRange(BuildContext context) {
  DateTimeRange(start: DateTime.now(), end: DateTime.now());
// ignore: unused_local_variable
  Future<DateTimeRange?> newDateRange = showDateRangePicker(
      context: context, firstDate: DateTime(200), lastDate: DateTime.now());
}

Future<void> permission() async {
  var status = await Permission.manageExternalStorage.status;
  if (!status.isGranted) {
    await Permission.manageExternalStorage.request();
  }
  var status1 = await Permission.storage.status;
  if (!status1.isGranted) {
    await Permission.storage.request();
  }
}
