import 'package:flutter/material.dart';

abstract class BaseViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validate() => formKey.currentState!.validate();

  TextEditingController blocknumbercontroller = TextEditingController();
  TextEditingController codecontroller = TextEditingController();
  TextEditingController colercontroller = TextEditingController();
  TextEditingController densitycontroller = TextEditingController();
  TextEditingController hightncontroller = TextEditingController();
  TextEditingController widthcontroller = TextEditingController();
  TextEditingController lenthcontroller = TextEditingController();
  TextEditingController typecontroller = TextEditingController();
  TextEditingController tiitlecontroller = TextEditingController();
  TextEditingController scissorcontroller = TextEditingController();
  TextEditingController companycontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController cuttingordernum = TextEditingController();

  clearfields() {
    colercontroller.clear();
    densitycontroller.clear();
    amountcontroller.clear();
    typecontroller.clear();
    hightncontroller.clear();
    widthcontroller.clear();
    lenthcontroller.clear();
    scissorcontroller.clear();
    companycontroller.clear();
    amountcontroller.clear();
    cuttingordernum.clear();
  }
}
