
import 'package:flutter/material.dart';
import 'package:nutritionanalysis/model/Response_Model.dart';

class RecipeItem extends StatelessWidget {
//final Results Recipe;
  const RecipeItem
  ({
    Key? key,//required this.Recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      height: 220,
      width: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.network(
           "https://spoonacular.com/recipeImages/716429-312x231.jpg",
              height: 80,
              width: 80,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs",
              //textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 3),
          
        ],
      ),
    );
  }
}
