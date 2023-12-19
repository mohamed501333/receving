// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jason_company/controllers/blockFirebaseController.dart';
import 'package:jason_company/controllers/cutting_order_controller.dart';
import 'package:jason_company/controllers/fireStoreController.dart';
import 'package:jason_company/controllers/setting_controller.dart';
import 'package:provider/provider.dart';
import 'package:jason_company/controllers/ObjectBoxController.dart';
import 'package:jason_company/controllers/main_controller.dart';
import 'package:jason_company/controllers/scissors_controller.dart';
import 'package:jason_company/dataScorse/objectBox_helper.dart';
import 'package:jason_company/ui/main/main_view.dart';

late Database database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAkWHl9E0KfHcvf5Ifx0WVvEXuvk2URhhs",
          appId: "1:106186917009:android:fcd892c86b7d3e3447ab30",
          messagingSenderId: "106186917009 ",
          projectId: "janson-11f24"));
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  FirebaseDatabase.instance.ref();
  database = await Database.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScissorsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ObjectBoxController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Firebasecontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => BlockFirebasecontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cutting_Order_controller(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: false),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: a() ? Mainview() : const CircularProgressIndicator(),
      ),
    );
  }
}

a() {
  //    هذا المتغير اجعله ثابت على الجهاز او من الانترنت
  bool x = true;
  //اطرح هنا التاريخ
  if (DateTime.now().compareTo(DateTime(2024, 1, 3)) >= 0) {
    x = false;
  }

  return x;
}
