import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../Components/Button.dart';
import '../Services/Api_Services.dart';
import '../model/Meal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  
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
      
                child: TypeAheadField<Meal?>(
      
      suggestionsCallback: (pattern) =>
          Api_Services.getMealSuggestion(query: pattern),

      itemBuilder: (context, Meal? suggestion) {
          final meal=suggestion!;
        return ListTile(
          title: Text(meal.title!),
        );
      },
      onSuggestionSelected: (Meal? suggestion) {
        //this function will execute when user clicks on suggested meal
},
      noItemsFoundBuilder: (context) => const Center(
        child: Text("No Meal Found"),
      ),
      debounceDuration:const Duration(milliseconds: 500),
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
