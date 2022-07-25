import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../Components/Button.dart';
import '../Services/Api_Services.dart';
import '../model/Response_Model.dart';

class Add_New_Item_Screen extends StatefulWidget {
  const Add_New_Item_Screen({Key? key}) : super(key: key);

  @override
  State<Add_New_Item_Screen> createState() => _Add_New_Item_ScreenState();
}

class _Add_New_Item_ScreenState extends State<Add_New_Item_Screen> {
  double? carbs;
  double? protein;
  double? fats;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
         const SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(function: (){}, text: "Recipes"),
                Button(function: () {}, text: "Food Item"),
                Button(function: () {}, text: "Add your own food"),
              ],
            ),
          ),
          const Padding(
            padding:EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
      
                child: 
                TypeAheadField<Results>(
      
      suggestionsCallback: (pattern) =>
          Api_Services.getMealSuggestion(query: pattern),

      itemBuilder: (context, Results suggestion) {
          final meal=suggestion;
        return ListTile(
          title: Card(child: Text(meal.title!)),
        );
      },
      onSuggestionSelected: (Results suggestion) {
        List<Nutrients>? nutrients=suggestion.nutrition!.nutrients;
         protein=nutrients![0].amount!;
         fats=nutrients[1].amount!;
         carbs=nutrients[2].amount!;
         
        print("protein: ${protein.toString()}");
        print("fats: ${fats.toString()}");
        print("carbs: ${carbs.toString()}");
        //this function will execute when user clicks on suggested meal
},
      noItemsFoundBuilder: (context) => const Center(
        child: Text("No Meal Found"),
      ),
      debounceDuration:const Duration(milliseconds: 400),
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
