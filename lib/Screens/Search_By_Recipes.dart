import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/model/RecipeInfo.dart';

import '../Components/Button.dart';
import '../Services/Api_Services.dart';
import '../Services/NutrientsController.dart';
import '../model/NutrientsModel.dart';
import '../model/Response_Model.dart';

class Search_By_Recipes extends StatefulWidget {
  const Search_By_Recipes({Key? key}) : super(key: key);

  @override
  State<Search_By_Recipes> createState() => _Search_By_RecipesState();
}

class _Search_By_RecipesState extends State<Search_By_Recipes> {
  // double? carbs;
  // double? protein;
  // double? fats;
  
  List<String>? ListOfTodaysFood;
  var _Nutrients=Get.put(NutrientsController());  
@override
  void initState() {
    // TODO: implement initState
    print("in  set state of recipe");
    super.initState();
     _Nutrients.getNutrients();
  // Future<RecipeInfo> rec = Api_Services.getRecipeNutrition(title: "Chicken 65");
  // ListOfTodaysFood = NutrientsController.getTodaysTitles();
    gettitles();
  
  }
  @override
  Widget build(BuildContext context) {
NutrientsModel _model=NutrientsModel(calories: 0, carb: 0, titles: [""]);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Search by Recipes",
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
                child: TypeAheadField<Results>(
                  suggestionsCallback: (pattern) =>
                      Api_Services.getMealSuggestion(query: pattern),
                  itemBuilder: (context, Results suggestion) {
                    final meal = suggestion;
                    return ListTile(
                      title: Card(child: Text(meal.title!)),
                      // trailing: IconButton(
                      //   onPressed: (){
                      //     print(meal.title);
                      //     print("hn bhaii");
                      //  Future<RecipeInfo> recipeInfo= Api_Services.getRecipeNutrition(title:"Chicken 65");
                      //   print(recipeInfo);
                      //   },
                      //    icon: Icon(Icons.add),color: Colors.black,),
                    );
                  },
                  onSuggestionSelected: (Results suggestion)async {
                    List<Nutrients>? nutrients =
                        suggestion.nutrition!.nutrients;
                    // protein = nutrients![0].amount!;
                    // fats = nutrients[1].amount!;
                    // carbs = nutrients[2].amount!;
                   RecipeInfo rc=await Api_Services.getRecipeNutrition(title: suggestion.title); 
                   print(rc.calories!.value);
                  // _model!.calories=0;
                   print(_model.calories);
                   _model.calories=rc.calories!.value;
                  print(_model.calories);
                      _model.carb=rc.carbs!.value;
                      ListOfTodaysFood!.add(suggestion.title??"");
                   _model.titles=ListOfTodaysFood;
                await  _Nutrients.addNutrition(nutrients: _model);
                _Nutrients.getNutrients();
                  print("get function called after add");
                      print(rc);
                    // print("protein: ${protein.toString()}");
                    // print("fats: ${fats.toString()}");
                    // print("carbs: ${carbs.toString()}");
                    //this function will execute when user clicks on suggested meal
                  },
                  noItemsFoundBuilder: (context) => const Center(
                    child: Text("No Meal Found"),
                  ),
                  debounceDuration: const Duration(milliseconds: 400),
                ),
              ),
              Button(function: () {}, text: "Search"),
            ],
          ),
        ],
      ),
    );
  }

   gettitles()async{
    ListOfTodaysFood=await _Nutrients.getTodaysTitles();
 
  }
}
