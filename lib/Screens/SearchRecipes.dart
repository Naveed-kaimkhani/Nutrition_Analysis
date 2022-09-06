import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/RecipeItem.dart';
import 'package:nutritionanalysis/Components/SearchBarWidget.dart';
import 'package:nutritionanalysis/Screens/NoUserFound.dart';
import 'package:nutritionanalysis/Screens/RecipeScreen.dart';
import 'package:nutritionanalysis/Services/Api_Services.dart';
import 'package:nutritionanalysis/model/RecipePageInfo.dart';

import '../model/Response_Model.dart';
import '../model/RecipePageInfo.dart';

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
              future: Api_Services.getKetoRecipes(),
              builder: (context, AsyncSnapshot<List<Results>> snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data!.length);
                  return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2 / 3.5,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("ja raaaa");
                            // print(snapshot.data![index].id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipeScreen(
                                        id: snapshot.data![index].id,
                                      )),
                            );
                            //   Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => NoUserFound()),
                            // );
                          },
                          child: RecipeItem(
                            recipe: snapshot.data![index],
                          ),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
