import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nutritionanalysis/Screens/HomeScreen.dart';
import 'Services/DbHelper.dart';
Future<void> main() async{
    WidgetsFlutterBinding.ensureInitialized();
  print("in main");
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     
        title: 'Flutter Demo',
        home: HomeScreen(),
      );
    
  }
}
