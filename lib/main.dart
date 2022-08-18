import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nutritionanalysis/Components/RecipeItem.dart';
import 'package:nutritionanalysis/Screens/HomeScreen.dart';
import 'package:nutritionanalysis/Screens/SearchRecipes.dart';
import 'package:nutritionanalysis/Screens/authScreens/SignIn.dart';
import 'package:nutritionanalysis/Services/authentication_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/authScreens/SignUp.dart';
import 'Services/DbHelper.dart';
import 'Services/UpdateData.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // print("in main");
  await Firebase.initializeApp();
  await DbHelper.initDb();
  SharedPreferences prefs = await SharedPreferences.getInstance();
                      UpdateData.SetDate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home:authentication_methods.hndleAuthState());
  }
}
