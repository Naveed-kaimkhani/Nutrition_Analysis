
import 'package:get/get.dart';
import 'package:nutritionanalysis/model/NutrientsModel.dart';

import 'DbHelper.dart';

class NutrientsController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

    var calories=0.obs;
  var carbs=0.obs;
  var titles=<String>[].obs;
     static var NutritionList = <NutrientsModel>[].obs;

  Future<int?> addNutrition({NutrientsModel? nutrients}) async {
   // pending_task.add(Task!);
   // print("task length is " + tasklist.length.toString());
   List<Map<String, dynamic>> Nutrientss=await DbHelper.query();
  // print(Nutrientss);
   //print("in add nutrition");
   
   if(Nutrientss.isNotEmpty){
      DbHelper.update(nutrientsModel: nutrients);
    //  print("add function ran sucesfflu in if");
   }
   else{
  // print("add function ran sucesfflu in else");
      return await DbHelper.insert(nutrients);
   
   }
    
  }

  void getNutrients() async {
    List<Map<String, dynamic>> Nutrients= await DbHelper.query();
    print(Nutrients);   
    NutritionList.assignAll(Nutrients.map((data) => new NutrientsModel.fromJson(data)).toList());
    print(NutritionList);
    print(NutritionList.length);
    print(NutritionList[0].calories);
   calories=NutritionList[0].calories  as RxInt;
    // print("exception in get nutrients");
    // print(NutritionList[ListLenght-1].calories);
    // calories=NutritionList[ListLenght-1].calories as RxInt;
     
    // carbs=NutritionList[ListLenght-1].carb as RxInt;
  }
       
       static Future<List<String>?> getTodaysTitles() async {
    List<Map<String, dynamic>> Nutrients= await DbHelper.query();
    List<NutrientsModel> NutritionListTitles;
    NutritionList.assignAll(Nutrients.map((data) => new NutrientsModel.fromJson(data)).toList());
   int lenght=NutritionList.length;
   print(lenght);
   if(lenght==0){
    return [""];
   }
   else{
  
    NutrientsModel model=NutritionList[lenght-1];
 print("exception in get today list");   
   return model.titles;
   }
   
  //print(model.titles);
 // return  lenght==0?[""]:model.titles;
  }
       
  // void delete(task t) async {
  //   DbHelper.delete(t);
  //   getTasks();
  
  // }
}
