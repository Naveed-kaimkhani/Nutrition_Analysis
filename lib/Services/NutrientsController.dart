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

  dynamic caloriess = 0;
  dynamic carbss = 0;
  dynamic apiCalls = 20;
  static var NutritionList = <NutrientsModel>[].obs;
  var todayList = <TodaysListFoodModel>[];

  Future<int?> addNutrition({NutrientsModel? nutrients}) async {
    List<Map<String, dynamic>> Nutrientss = await DbHelper.query("Nutrients");

    if (Nutrientss.isNotEmpty) {
      await DbHelper.update(nutrientsModel: nutrients);
    } else {
      return await DbHelper.insert(nutrients, "Nutrients");
    }
  }

  Future<int?> addToTodayList({TodaysListFoodModel? model}) async {
    return await DbHelper.insertToTodayList(model, "todayfoodlist");
  }

  void getNutrients() async {
    List<Map<String, dynamic>> Nutrients = await DbHelper.query("Nutrients");
    NutritionList.assignAll(
        Nutrients.map((data) => new NutrientsModel.fromJson(data)).toList());

    if (NutritionList.length != 0) {
      caloriess = NutritionList[0].calories;
      carbss = NutritionList[0].carb;

      update();
    }
    todayList = await getTodayFoodList();
    update();
  }

  void updateTodayList(TodaysListFoodModel recipe) async {
    await DbHelper.delete(recipe);
    todayList.remove(recipe);
    print(todayList.length);
    todayList = await getTodayFoodList();
    update();
  }

  Future<List<TodaysListFoodModel>> getTodayFoodList() async {
    List<Map<String, dynamic>> TodaysListFood =
        await DbHelper.query("todayfoodlist");
    //  print(Nutrients);
    todayList.assignAll(
        TodaysListFood.map((data) => TodaysListFoodModel.fromJson(data))
            .toList());
    return todayList;
  }


  getAvailableCalls() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    apiCalls = prefs.getInt("availableCalls");
    print("in get calls");
  }

  void updateAvailableCalls() async {
    --apiCalls;
    update();
  }
}
