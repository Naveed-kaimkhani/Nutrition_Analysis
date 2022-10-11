import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:nutritionanalysis/Components/RecipeItem.dart';
import 'package:nutritionanalysis/Components/SearchBarWidget.dart';
import 'package:nutritionanalysis/Components/ShowRecipeWidget.dart';
import 'package:nutritionanalysis/Components/shimmer_effect.dart';
import 'package:nutritionanalysis/Constant/globlevariables.dart';
import 'package:nutritionanalysis/Screens/HomeScreen.dart';
import 'package:nutritionanalysis/Screens/NoUserFound.dart';
import 'package:nutritionanalysis/Screens/RecipeScreen.dart';
import 'package:nutritionanalysis/Services/Api_Services.dart';
import 'package:nutritionanalysis/model/RecipePageInfo.dart';

import '../Components/TodayListWidget.dart';
import '../Components/search_bar_header.dart';
import '../model/Response_Model.dart';
import '../model/RecipePageInfo.dart';
import 'Search_by_foodItem.dart';

class SearchRecipes extends StatefulWidget {
  SearchRecipes({Key? key}) : super(key: key);

  @override
  State<SearchRecipes> createState() => _SearchRecipesState();
}

class _SearchRecipesState extends State<SearchRecipes> {
//List<Recipes>? recipes;

  @override
  Widget build(BuildContext context) {
    return false
        ? SafeArea(
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
                                  ));
                              // ShowRecipeWidget(
                              //     recipe: snapshot.data![index]));
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
          )
        : Scaffold(
            backgroundColor: globalVariables.backgroundColor,
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
                child: Column(
              children: [
                search_bar_header(),
                FutureBuilder(
                    future: Api_Services.getKetoRecipes(),
                    builder: (context, AsyncSnapshot<List<Results>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => RecipeScreen(
                                        id: snapshot.data![index].id,
                                      ));
                                },
                                child: AnimationConfiguration.staggeredList(
                                    duration: Duration(microseconds: 900),
                                    position: index,
                                    child: SlideAnimation(
                                        duration: Duration(milliseconds: 900),
                                        child: FadeInAnimation(
                                            // duration:
                                            //     Duration(milliseconds: 1000),
                                            child: TodayListWidget(
                                              recipe: snapshot.data![index],
                                              index: index,
                                            )))),
                              );
                            });
                      } else {
                        return ShimmerEffect();
                        
                      }
                    })
              ],
            )),
          );
  }
}
