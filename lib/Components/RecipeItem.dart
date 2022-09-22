import 'package:flutter/material.dart';
import 'package:nutritionanalysis/model/Response_Model.dart';

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
        padding: EdgeInsets.all(3),
        alignment: Alignment.topRight,
        width: 200,
        decoration: BoxDecoration(
          //color: Colors.grey[200],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.network(recipe.image!, fit: BoxFit.cover),
            Text(
              recipe.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              // "Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                wordSpacing: 3,
              ),
            ),
            //           ),Image.network(recipe.image!, fit: BoxFit.contain)]),
            // Align(
            //     alignment: Alignment.topLeft,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.only(top: 12),
            //           child: Text(
            //             recipe.title!,
            //             overflow: TextOverflow.ellipsis,
            //             maxLines: 3,
            //             // "Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs",
            //             textAlign: TextAlign.start,
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //               wordSpacing: 3,
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.only(top: 2),
            //           child: Text(
            //               "Carbs:${recipe.nutrition!.nutrients![2].amount!.round().toString()} g",
            //               style: TextStyle(
            //                   //    fontWeight: FontWeight.bold,
            //                   )),
            //         ),
            //       ],
            //     )),
            SizedBox(height: 3),
          ],
        ));
  }
}
