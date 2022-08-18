import 'package:flutter/material.dart';
import 'package:nutritionanalysis/model/Response_Model.dart';
import 'package:nutritionanalysis/model/ShowRecipe.dart';

class RecipeItem extends StatelessWidget {
  final Results recipe;
  const RecipeItem({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(5),
      alignment: Alignment.topLeft,
      height: 270,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.network(
              recipe.image!,
              height: 100,
              width: 100,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              recipe.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              // "Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 3),
        ],
      ),
    );
  }
}
