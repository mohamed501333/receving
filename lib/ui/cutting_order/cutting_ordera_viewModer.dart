import 'package:flutter/material.dart';
import 'package:jason_company/app/extentions.dart';
import 'package:jason_company/controllers/cutting_order_controller.dart';
import 'package:jason_company/models/moderls.dart';
import 'package:jason_company/ui/base/base_view_mode.dart';
import 'package:provider/provider.dart';

class CuttingOrderViewModel extends BaseViewModel {
  insertcuttingorder(BuildContext context) {
    if (formKey.currentState!.validate()) {
      CuttingOrderModel cuttingorder = CuttingOrderModel(
        datequality: DateTime.now(),
        amonunt: amountcontroller.text.to_int(),
        id: DateTime.now().millisecondsSinceEpoch,
        color: colercontroller.text,
        type: typecontroller.text,
        density: densitycontroller.text.to_int(),
        customer: companycontroller.text,
        hight: hightncontroller.text.to_int(),
        wedth: widthcontroller.text.to_int(),
        lenth: lenthcontroller.text.to_int(),
        date: DateTime.now(),
        datecutted: DateTime.now(),
        daterecieved: DateTime.now(),
      );
      context.read<Cutting_Order_controller>().addcuttingOrder(cuttingorder);
    }
    clearfields();
  }

  deletecuttingOrder(BuildContext context, id) {
    context.read<Cutting_Order_controller>().deletecuttingOrder(id);
  }

  cutted(BuildContext context, id) {
    context.read<Cutting_Order_controller>().cutted(id);
  }

  received(BuildContext context, id) {
    context.read<Cutting_Order_controller>().recived(id);
  }

  quality(BuildContext context, id) {
    context.read<Cutting_Order_controller>().quality(id);
  }
}
