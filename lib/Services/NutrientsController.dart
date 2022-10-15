import 'package:get/get.dart';
import 'package:nutritionanalysis/model/NutrientsModel.dart';
import 'package:nutritionanalysis/model/TodaysListFoodModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DbHelper.dart';

class NutrientsController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }
//dynamic currentIndex=0.obs;

  dynamic caloriess = 0;
  dynamic carbss = 0;
  dynamic apiCalls=20;
  dynamic titless = <String>[];
  static var NutritionList = <NutrientsModel>[].obs;
  var todayList = <TodaysListFoodModel>[];

  Future<int?> addNutrition({NutrientsModel? nutrients}) async {
    // pending_task.add(Task!);
    // print("task length is " + tasklist.length.toString());
    List<Map<String, dynamic>> Nutrientss = await DbHelper.query("Nutrients");
    // print(Nutrientss[0]??"no object in db");
    // print(Nutrientss.length??"0");
    // print(Nutrientss);
    //print("in add nutrition");
    // print(Nutrientss.isNotEmpty);
    if (Nutrientss.isNotEmpty) {
      await DbHelper.update(nutrientsModel: nutrients);
      // print("add function ran sucesfflu in if");
    } else {
      // print("add function ran sucesfflu in else");
      return await DbHelper.insert(nutrients, "Nutrients");
    }
  }
Future<int?> addToTodayList({TodaysListFoodModel? model}) async {
    // pending_task.add(Task!);
    // print("task length is " + tasklist.length.toString());
    // List<Map<String, dynamic>> Nutrientss = await DbHelper.query();
    // print(Nutrientss[0]??"no object in db");
    // print(Nutrientss.length??"0");
    // print(Nutrientss);
    //print("in add nutrition");
    // print(Nutrientss.isNotEmpty);
    
    return await DbHelper.insertToTodayList(model, "todayfoodlist");
  }
  // void updateIndex(dynamic index){
  //   currentIndex=index;
  // }
  void getNutrients() async {
    List<Map<String, dynamic>> Nutrients = await DbHelper.query("Nutrients");
  //  print(Nutrients);
    NutritionList.assignAll(
        Nutrients.map((data) => new NutrientsModel.fromJson(data)).toList());
    // print(NutritionList);
    // print(NutritionList.length);
    // print(NutritionList[0].calories??".....");
    if (NutritionList.length != 0) {
      // print("in if of getNutrients update wala method");
      caloriess = NutritionList[0].calories;
      carbss = NutritionList[0].carb;
      // print("carbss me $carbss");
      // print("cal me $caloriess");
      update();
    }
    todayList= await getTodayFoodList();
    update();
    // await getTodaysTitles();
    // print("get nutrients done");
  }

  Future<List<TodaysListFoodModel>> getTodayFoodList() async {
    List<Map<String, dynamic>> TodaysListFood = await DbHelper.query("todayfoodlist");
  //  print(Nutrients);
    todayList.assignAll(
        TodaysListFood.map((data) => TodaysListFoodModel.fromJson(data)).toList());
    return todayList;
  }

  Future<List<String>?> getTodaysTitles() async {
    List<Map<String, dynamic>> Nutrients = await DbHelper.query("Nutrients");
    List<NutrientsModel> NutritionListTitles;
    NutritionList.assignAll(
        Nutrients.map((data) => new NutrientsModel.fromJson(data)).toList());
    int lenght = NutritionList.length;
    // print(lenght);
    if (lenght == 0) {
      return [];
    } else {
      NutrientsModel model = NutritionList[lenght - 1];
      // print(" get today list");
      // print(model.titles);
      titless = model.titles;
      update();
      return titless;
    }

    //print(model.titles);
    // return  lenght==0?[""]:model.titles;
  }

  // void delete(task t) async {
  //   DbHelper.delete(t);
  //   getTasks();

  // }

    getAvailableCalls() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // String currentDate = DateFormat('dd-MM-yyyy').format(now);
    apiCalls = prefs.getInt("availableCalls");
    // print(availableCalls);
    print("in get calls");
    // yield availableCalls!;
  }
     void updateAvailableCalls()async{
       SharedPreferences prefs = await SharedPreferences.getInstance();
        int? availableCalls = prefs.getInt("availableCalls");
  if( availableCalls!=null) --availableCalls;
  apiCalls=availableCalls;
    prefs.setInt("availableCalls",apiCalls!);
    print("remaining calls");
    print(availableCalls);
    update();

  }
}
