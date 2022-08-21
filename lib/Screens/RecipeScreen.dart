import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nutritionanalysis/model/RecipePageInfo.dart';

import '../Services/Api_Services.dart';
import '../model/RecipeInfo.dart';

class RecipeScreen extends StatelessWidget {
  int? id;
   RecipeScreen({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder(
              future: Api_Services.getRecipeInform(id: id),
              builder: (context, AsyncSnapshot<RecipePageInfo> snapshot) {
                if (snapshot.hasData) {
                 // print(snapshot.data!.length);
                 return Column(
                  children: [
                      Text(snapshot.data!.title!),
                      Text(snapshot.data!.ketogenic.toString()),
                      
                  ],
                 );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
      );
    
  }
}