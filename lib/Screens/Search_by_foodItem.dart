import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:nutritionanalysis/model/Food_Item.dart';

import '../Components/Button.dart';
import '../Services/Api_Services.dart';

class Search_by_foodItem extends StatefulWidget {
  const Search_by_foodItem({Key? key}) : super(key: key);

  @override
  State<Search_by_foodItem> createState() => _Search_by_foodItemState();
}

class _Search_by_foodItemState extends State<Search_by_foodItem> {
  double? carbs;
  double? protein;
  double? fats;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  Api_Services.getFoodNutrition(id: "9266");
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
                  onSuggestionSelected: (FoodResults suggestion) {
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
