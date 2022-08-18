import 'package:get/get.dart';
import 'package:nutritionanalysis/model/NutrientsModel.dart';

import 'DbHelper.dart';

class NutrientsController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }
//dynamic currentIndex=0.obs;

  dynamic caloriess = 0.obs;
  dynamic carbss = 0.obs;
  dynamic titless = <String>[].obs;
  static var NutritionList = <NutrientsModel>[].obs;

  Future<int?> addNutrition({NutrientsModel? nutrients}) async {
    // pending_task.add(Task!);
    // print("task length is " + tasklist.length.toString());
    List<Map<String, dynamic>> Nutrientss = await DbHelper.query();
    // print(Nutrientss[0]??"no object in db");
    // print(Nutrientss.length??"0");
    // print(Nutrientss);
    //print("in add nutrition");
      print(Nutrientss.isNotEmpty);
    if (Nutrientss.isNotEmpty) {
      await DbHelper.update(nutrientsModel: nutrients);
      print("add function ran sucesfflu in if");
    } else {
      print("add function ran sucesfflu in else");
      return await DbHelper.insert(nutrients, "Nutrients");
    }
  }

  // void updateIndex(dynamic index){
  //   currentIndex=index;
  // }
  void getNutrients() async {
    List<Map<String, dynamic>> Nutrients = await DbHelper.query();
    print(Nutrients);
    NutritionList.assignAll(
        Nutrients.map((data) => new NutrientsModel.fromJson(data)).toList());
    print(NutritionList);
    print(NutritionList.length);
    // print(NutritionList[0].calories??".....");
    if (NutritionList.length != 0) {
      caloriess = NutritionList[0].calories;
      carbss = NutritionList[0].carb;
      print("carbss me $carbss");
      print("cal me $caloriess");
    }
    await getTodaysTitles();
    print("get nutrients done");
  }

  Future<List<String>?> getTodaysTitles() async {
    List<Map<String, dynamic>> Nutrients = await DbHelper.query();
    List<NutrientsModel> NutritionListTitles;
    NutritionList.assignAll(
        Nutrients.map((data) => new NutrientsModel.fromJson(data)).toList());
    int lenght = NutritionList.length;
    print(lenght);
    if (lenght == 0) {
      return [""];
    } else {
      NutrientsModel model = NutritionList[lenght - 1];
      print(" get today list");
      print(model.titles);
      titless = model.titles;
      return titless;
    }

    //print(model.titles);
    // return  lenght==0?[""]:model.titles;
  }

  // void delete(task t) async {
  //   DbHelper.delete(t);
  //   getTasks();

  // }
}
