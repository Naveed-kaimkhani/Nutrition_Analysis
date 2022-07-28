import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../Components/Button.dart';
import '../Services/Api_Services.dart';
import '../model/Response_Model.dart';

class Search_By_Recipes extends StatefulWidget {
  const Search_By_Recipes({Key? key}) : super(key: key);

  @override
  State<Search_By_Recipes> createState() => _Search_By_RecipesState();
}

class _Search_By_RecipesState extends State<Search_By_Recipes> {
  double? carbs;
  double? protein;
  double? fats;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Api_Services.getRecipeNutrition(title: "Chicken 95");

  }
  @override
  Widget build(BuildContext context) {
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
                    );
                  },
                  onSuggestionSelected: (Results suggestion) {
                    List<Nutrients>? nutrients =
                        suggestion.nutrition!.nutrients;
                    protein = nutrients![0].amount!;
                    fats = nutrients[1].amount!;
                    carbs = nutrients[2].amount!;

                    print("protein: ${protein.toString()}");
                    print("fats: ${fats.toString()}");
                    print("carbs: ${carbs.toString()}");
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
}
