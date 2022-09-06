import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/model/Food_Item.dart';
import 'package:nutritionanalysis/model/Food_info.dart';

import '../Components/Button.dart';
import '../Services/Api_Services.dart';
import '../Services/NutrientsController.dart';
import '../model/NutrientsModel.dart';

class Search_by_foodItem extends StatefulWidget {
  const Search_by_foodItem({Key? key}) : super(key: key);

  @override
  State<Search_by_foodItem> createState() => _Search_by_foodItemState();
}

class _Search_by_foodItemState extends State<Search_by_foodItem> {
  //double? carbs;
 // double? protein;
  //double? fats;
  //List<String>? ListOfTodaysFood;
  var _Nutrients = Get.put(NutrientsController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NutrientsModel _model = NutrientsModel(calories: 0, carb: 0, titles: [""]);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Search by food",
            style: TextStyle(
                fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Text(
              "Add",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 250,
                color: Colors.white,
                child: TypeAheadField<FoodResults>(
                  suggestionsCallback: (pattern) =>
                      Api_Services.getFoodSuggestion(query: pattern),
                  itemBuilder: (context, FoodResults suggestion) {
                    final meal = suggestion;
                    return ListTile(
                      title: Card(child: Text(meal.name!)),
                    );
                  },
                  onSuggestionSelected: (FoodResults suggestion) async {
                    //this function will execute when user clicks on suggested meal
                    int? id = suggestion.id;
                    List<FoodNutrients> nutrnts =
                        await Api_Services.getFoodNutrition(id: id);
                    _model.calories = nutrnts[18].amount;
                    _model.carb = nutrnts[6].amount;
                    print("food calories${_model.calories}");
                    print("food calories${_model.carb}");
                    print("list of titles in fooditem");
                    print(_Nutrients.titless);
                    String ti = _Nutrients.titless.toString();
                    List<String> lot = ti.split(',');
                    lot.add(suggestion.name!);
                    print("models title${_model.titles}");
                    _model.titles=lot;
                    //  print(_model.titles);
                    //    print("before add Nutrition");
                    await _Nutrients.addNutrition(nutrients: _model);
                    _Nutrients.getNutrients();
                  },
                  noItemsFoundBuilder: (context) => const Center(
                    child: Text("No Meal Found"),
                  ),
                  debounceDuration: const Duration(milliseconds: 400),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
