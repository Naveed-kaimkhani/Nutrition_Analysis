import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nutritionanalysis/model/RecipePageInfo.dart';

import '../Services/Api_Services.dart';
import '../model/RecipeInfo.dart';

class RecipeScreen extends StatelessWidget {
  int? id;
  RecipeScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: FutureBuilder(
            future: Api_Services.getRecipeInform(id: id),
            builder: (context, AsyncSnapshot<RecipePageInfo> snapshot) {
              if (snapshot.hasData) {
                // print(snapshot.data!.length);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(snapshot.data!.image!),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Text(
                          snapshot.data!.title!,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // Text(snapshot.data!.title!),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //MainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Prep Time: \n   ${snapshot.data!.readyInMinutes!} mins",
                            style: TextStyle(fontSize: 15),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Text(
                            "Servings: \n       ${snapshot.data!.servings}",
                            style: TextStyle(fontSize: 15),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Text(
                            "Calories: \n  ${snapshot.data!.nutrition!.nutrients![0].amount}",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 12.0),
                      child: Text("Ingredients",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      // color: Colors.black,
                      margin: EdgeInsets.only(top: 6, left: 4),
                      height: size.height / 3,
                      width: size.width,
                      child: ListView.builder(
                          itemCount: snapshot.data!.extendedIngredients!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 4.0, left: 6),
                              child: Row(
                                children: [
                                  // Image.network(snapshot.data!
                                  //     .extendedIngredients![index].image!),
                                  Text(
                                    "${snapshot.data!.extendedIngredients![index].name!}  ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Text(
                                    "${snapshot.data!.extendedIngredients![index].amount!.toString()} ",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(snapshot
                                      .data!.extendedIngredients![index].unit!
                                      .toString())
                                ],
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 12.0),
                      child: Text("Instructions",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0, left: 6),
                      child: Text(
                        snapshot.data!.instructions!,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 12.0),
                      child: Text("Summary",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0, left: 6),
                      child: Text(
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        snapshot.data!.summary!,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      )),
    );
  }
}
