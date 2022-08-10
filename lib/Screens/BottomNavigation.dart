import 'package:flutter/material.dart';
import 'package:nutritionanalysis/Screens/HomeScreen.dart';
import 'package:nutritionanalysis/Screens/SearchRecipe.dart';

class BottomNavigation extends StatefulWidget {
   BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List _screens=[HomeScreen(),SearchRecipe()];

  int _currentIndex=0;

  //  void _updateIndex(dynamic value) {
   
  //   _Nutrients.updateIndex(value);
  // }
  // var _Nutrients = Get.put(NutrientsController());
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // //  print("init of homepage");
  //   _Nutrients.getNutrients();
  // }
  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_screens[_currentIndex],
    bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex:_currentIndex,
        onTap:_updateIndex,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: const[
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),

          ),
          BottomNavigationBarItem(
            label: "Search Recipe",
            icon: Icon(Icons.dining_sharp),
          ),
        ],
    ));
  }
}