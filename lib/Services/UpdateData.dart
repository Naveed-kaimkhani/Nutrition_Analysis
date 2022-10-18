import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nutritionanalysis/Services/NutrientsController.dart';
import 'package:nutritionanalysis/model/NutrientsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DbHelper.dart';

class UpdateData {
  static var _Nutrients = Get.put(NutrientsController());

  static void SetDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final now = DateTime.now();
    String currentDate = DateFormat('dd-MM-yyyy').format(now);

    prefs.setString("currentDate", currentDate);
    // print("date seted");
  }

  static void setCalls() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String currentDate = getCurrentDate();
    String? storedDate = prefs.getString("currentDate");

    if (currentDate != storedDate) {
      prefs.setInt("availableCalls", 20);
    }
    print("calls set");
  }

  // }
  static String getCurrentDate() {
    final now = DateTime.now();
    String currentDate = DateFormat('dd-MM-yyyy').format(now);

    return currentDate;
  }

  static void UpdateValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String currentDate = getCurrentDate();
    String? storedDate = prefs.getString("currentDate");

    if (currentDate == storedDate) {
      List<Map<String, dynamic>> Nutrients = await DbHelper.queryRow(1);

      NutrientsModel nutrientsModel = NutrientsModel.fromJson(Nutrients[0]);
      await DbHelper.insert(nutrientsModel, "LastWeek");
      await DbHelper.ResetNutrientsCounter();
      prefs.setString("currentDate", currentDate);
    }
  }
}
