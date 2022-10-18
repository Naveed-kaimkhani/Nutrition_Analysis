import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:nutritionanalysis/Constant/globlevariables.dart';

import 'package:nutritionanalysis/Screens/RecipeScreen.dart';
import 'package:nutritionanalysis/Services/Api_Services.dart';

import '../Components/TodayListWidget.dart';
import '../Components/search_bar_header.dart';
import '../model/Response_Model.dart';
import 'Search_by_foodItem.dart';

class SearchRecipes extends StatefulWidget {
  SearchRecipes({Key? key}) : super(key: key);

  @override
  State<SearchRecipes> createState() => _SearchRecipesState();
}

class _SearchRecipesState extends State<SearchRecipes> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                                    
                                            child: TodayListWidget(
                                              recipe: snapshot.data![index],
                                            )))),
                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })
              ],
            )),
          );
  }
}
