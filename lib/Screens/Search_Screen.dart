import 'package:flutter/material.dart';
import 'package:nutritionanalysis/Components/search_bar_header.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';
import 'package:nutritionanalysis/Screens/Search_by_foodItem.dart';


class Search_Screen extends StatelessWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: globalVariables.backgroundColor,
      appBar: const CustomAppBar(),
      body: Column(
        children: const [
         search_bar_header()
        ],
      ),
    );
  }
}