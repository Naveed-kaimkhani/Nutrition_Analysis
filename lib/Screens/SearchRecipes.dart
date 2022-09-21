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
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 120, top: 10),
              child: ListTile(
                title: Text(
                  "Choose a diet",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("make your life healthy, by a perfect diet"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: SearchBarWidget(
                hasBackButton: false,
                isReadOnly: true,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
          height: 500,
          child: FutureBuilder(
              future: Api_Services.getKetoRecipes(),
              builder: (context, AsyncSnapshot<List<Results>> snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data!.length);
                  return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.5,
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
    ])));
  }
}
