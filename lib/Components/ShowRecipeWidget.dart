import 'package:flutter/material.dart';
import 'package:nutritionanalysis/model/Response_Model.dart';

class ShowRecipeWidget extends StatelessWidget {
  final Results recipe;
  const ShowRecipeWidget({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5.0),
                       image: DecorationImage(
      image: NetworkImage(recipe.image!),

                    ),
                
              ))
            ],
          );
  }
}
