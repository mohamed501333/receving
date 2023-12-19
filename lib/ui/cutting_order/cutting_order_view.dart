import 'package:flutter/material.dart';
import 'package:jason_company/ui/cutting_order/componants.dart';
import 'package:jason_company/ui/cutting_order/cutting_ordera_viewModer.dart';

class CuttingOrderView extends StatelessWidget {
  const CuttingOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    CuttingOrderViewModel vm = CuttingOrderViewModel();
    return Scaffold(
      appBar: AppBar(title: const Text('اوامر التشغيل')),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TheTable001(
              vm: vm,
            )
          ],
        ),
      ),
    );
  }
}
