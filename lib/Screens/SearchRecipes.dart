import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchRecipes extends StatefulWidget {
  const SearchRecipes({Key? key}) : super(key: key);

  @override
  State<SearchRecipes> createState() => _SearchRecipesState();
}

class _SearchRecipesState extends State<SearchRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("searh recipe")),
    );
  }
}
