import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jason_company/controllers/blockFirebaseController.dart';
import 'package:jason_company/controllers/cutting_order_controller.dart';
import 'package:jason_company/controllers/fireStoreController.dart';
import 'package:jason_company/controllers/scissors_controller.dart';
import 'package:jason_company/ui/main/componants/nav_bar.dart';
import 'package:jason_company/controllers/main_controller.dart';
import 'package:jason_company/ui/main/main_viewModel.dart';
import 'package:jason_company/ui/recources/color_manager.dart';
import 'package:provider/provider.dart';

class Mainview extends StatelessWidget {
  Mainview({
    super.key,
  });

  final MainViewModel vm = MainViewModel();

  @override
  Widget build(BuildContext context) {
    context.read<Firebasecontroller>().stream();
    context.read<BlockFirebasecontroller>().stream();
    context.read<Cutting_Order_controller>().stream();
    FirebaseAuth.instance.currentUser?.reload();

    return Scaffold(
      backgroundColor: ColorManager.gallery,
      appBar: AppBar(
        title: Consumer<MainController>(
          builder: (context, myType, child) {
            return Center(
                child: Text(
              vm.indexOfAppBar(myType.currentIndex,
                  context.watch<ScissorsController>().indexOfRadioButon),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ));
          },
        ),
      ),
      body: Consumer<MainController>(
        builder: (context, controller, child) {
          return vm.screens[controller.currentIndex];
        },
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
