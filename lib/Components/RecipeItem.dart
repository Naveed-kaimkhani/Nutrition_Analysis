import 'package:flutter/material.dart';
import 'package:nutritionanalysis/model/Response_Model.dart';
import 'package:nutritionanalysis/model/RecipePageInfo.dart';

class RecipeItem extends StatelessWidget {
  final Results recipe;
  const RecipeItem({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      alignment: Alignment.topLeft,
      height: 400,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    // "Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                        "Carbs:${recipe.nutrition!.nutrients![2].amount!.round().toString()} g",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              )),
          SizedBox(height: 3),
        ],
      ),
    );
  }
}
