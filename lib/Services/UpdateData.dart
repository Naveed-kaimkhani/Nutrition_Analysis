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
  
    if(currentDate!=storedDate){
        prefs.setInt("availableCalls",20);
    }
  // int? cl=    await UpdateData.getAvailableCalls();
  print("calls set");
  // print(cl);
    // if(currentDate!=storedDate){

    // }
    // print("date seted");
  }
  
  // static Stream<int>? getAvailableCalls() async*{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
    
  //   // String currentDate = DateFormat('dd-MM-yyyy').format(now);
  //   int? availableCalls = prefs.getInt("availableCalls");
  //   print(availableCalls);
  //   print("in get calls");
  //   yield availableCalls!;
  // }
  // static void updateAvailableCalls()async{
  //      SharedPreferences prefs = await SharedPreferences.getInstance();
  //       int? availableCalls = prefs.getInt("availableCalls");
  // if( availableCalls!=null) --availableCalls;
  //   prefs.setInt("availableCalls",availableCalls!);
  //   print("remaining calls");
  //   print(availableCalls);

  // }
  static String getCurrentDate() {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    String currentDate = DateFormat('dd-MM-yyyy').format(now);
    //String? StoredDate= prefs.getString("currentDate");
    // print("in get currentdate func $currentDate");
    return currentDate;
  }

  static void UpdateValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String currentDate = getCurrentDate();
    String? storedDate = prefs.getString("currentDate");
    // print("update valeus func $storedDate");
    // print("in update values func");
    // print(currentDate);
    // print("stored value is ${storedDate}");
    // print(currentDate == storedDate);
    if (currentDate == storedDate) {
      //update values
      List<Map<String, dynamic>> Nutrients = await DbHelper.queryRow(1);
      // print(Nutrients[0]);
      NutrientsModel nutrientsModel = NutrientsModel.fromJson(Nutrients[0]);
      await DbHelper.insert(nutrientsModel, "LastWeek");
      await DbHelper.ResetNutrientsCounter();
      //  _Nutrients.getNutrients();
      prefs.setString("currentDate", currentDate);
      // print("values 0");
    }
    // print("not in if");
  }
}
