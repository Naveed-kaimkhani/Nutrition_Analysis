import 'package:flutter/material.dart';
import 'package:nutritionanalysis/Screens/OwnNutrients.dart';
import 'package:nutritionanalysis/Screens/Search_By_Recipes.dart';
import 'package:nutritionanalysis/Screens/Search_by_foodItem.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const TabBar(
              tabs: [
                Text(
                  "Recipes",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Food Item",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "your Own food",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          body:  TabBarView(
            children: [
            const  Search_By_Recipes(),
            const  Search_by_foodItem(),
             OwnNutrients()
            ],
          ),
        ),
      ),
    );
  }
}
