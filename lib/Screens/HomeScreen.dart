import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../Services/Api_Services.dart';
import '../model/Meal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(function: () {}, text: "Recipes"),
                Button(function: () {}, text: "Food Item"),
                Button(function: () {}, text: "Add your own food"),
              ],
            ),
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Text(
              "Add",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 250,
                color: Colors.white,
                child: TypeAheadField<Meal>(
                  suggestionsCallback: (pattern) =>
                      Api_Services.getMealSuggestion(query: pattern),
                  itemBuilder: (context, Meal? suggestion) {
                    final Meal = suggestion!;

                    return ListTile(
                      title: Text(Meal.title!),
                    );
                  },
                  onSuggestionSelected: (Meal? suggestion) {
                    //this function will execute when user clicks on suggested meal

                    final meal =
                        suggestion!; //Do processing on this meal object
                    print("Fat: ${meal.fat.toString()}");
                    print("Protein: ${meal.protein.toString()}");
                    print("Fat: ${meal.carbs.toString()}");
                  },
                  noItemsFoundBuilder: (context) => const Center(
                    child: Text("No Meal Found"),
                  ),
                  debounceDuration: Duration(milliseconds: 500),
                ),
              ),
              Button(function: () {}, text: "Search"),
            ],
          ),
        ],
      ),
    );
  }

  TypeAheadField<Meal> SuggestionTextField() {
    return TypeAheadField<Meal>(
      suggestionsCallback: (pattern) =>
          Api_Services.getMealSuggestion(query: pattern),
      itemBuilder: (context, Meal? suggestion) {
        final Meal = suggestion!;

        return ListTile(
          title: Text(Meal.title!),
        );
      },
      onSuggestionSelected: (Meal? suggestion) {
        //this function will execute when user clicks on suggested meal

        final meal = suggestion!; //Do processing on this meal object
        print("Fat: ${meal.fat.toString()}");
        print("Protein: ${meal.protein.toString()}");
        print("Fat: ${meal.carbs.toString()}");
      },
      noItemsFoundBuilder: (context) => const Center(
        child: Text("No Meal Found"),
      ),
      debounceDuration: Duration(milliseconds: 500),
    );
  }
}

class Button extends StatelessWidget {
  final String? text;
  final Function()? function;

  const Button({
    Key? key,
    required this.function,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 100,
        color: Colors.black,
        child: GestureDetector(
          onTap: function,
          child: Center(
            child: Text(
              text!,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ));
  }
}
