import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';
import 'package:nutritionanalysis/Screens/HomeScreen.dart';
import 'package:nutritionanalysis/Screens/RecipeScreen.dart';
import 'package:nutritionanalysis/Screens/SearchRecipes.dart';
import 'package:nutritionanalysis/Screens/Search_By_Recipes.dart';
import 'package:nutritionanalysis/Screens/Search_Screen.dart';
import 'package:nutritionanalysis/Screens/Search_by_foodItem.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Services/DbHelper.dart';
import 'Services/UpdateData.dart';
import 'package:firebase_core/firebase_core.dart';

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
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return  GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Nutrition Analysis',
              color: globalVariables.backgroundColor,
              home:SearchRecipes());
        });
  }
}
