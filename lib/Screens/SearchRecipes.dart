import 'package:flutter/material.dart';
import 'package:nutritionanalysis/Components/RecipeItem.dart';
import 'package:nutritionanalysis/Components/SearchBarWidget.dart';
import 'package:nutritionanalysis/Services/Api_Services.dart';
import 'package:nutritionanalysis/model/ShowRecipe.dart';

import '../model/Response_Model.dart';
import '../model/ShowRecipe.dart';

class SearchRecipes extends StatefulWidget {
  SearchRecipes({Key? key}) : super(key: key);

  @override
  State<SearchRecipes> createState() => _SearchRecipesState();
}

class _SearchRecipesState extends State<SearchRecipes> {
//List<Recipes>? recipes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: SearchBarWidget(
            hasBackButton: false,
            isReadOnly: true,
          ),
          body: FutureBuilder(
              future: Api_Services.getMealSuggestion(query: "Chicken"),
              builder: (context, AsyncSnapshot<List<Results>> snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data!.length);
                  return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2 / 3.3,
                      ),
                      itemBuilder: (context, index) {
                        return RecipeItem(
                          recipe: snapshot.data![index],
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
