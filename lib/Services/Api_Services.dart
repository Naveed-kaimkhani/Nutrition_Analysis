import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nutritionanalysis/model/Food_Item.dart';
import 'package:nutritionanalysis/model/Food_info.dart';
import 'package:nutritionanalysis/model/Response_Model.dart';
import 'package:nutritionanalysis/model/RecipePageInfo.dart';

import '../model/RecipeInfo.dart';

class Api_Services {
  static String baseUrlForRecipes =
      "https://api.spoonacular.com/recipes/complexSearch?query=";

  static String ApiKey = "c020b400a8244106a0b807006800605b";

  static Future<List<Results>> getMealSuggestion({String? query}) async {
    String parameter =
        "&maxFat=100&maxProtein=100&maxCarbs=200&number=50&apiKey=";

    http.Response response =
        await http.get(Uri.parse('$baseUrlForRecipes$query$parameter$ApiKey'));
    if (response.statusCode == 200) {
      var meals = json.decode(response.body);
      // print(meals);
      Response_Model RM = Response_Model.fromJson(meals);

      return RM.results!;
    } else {
      throw Exception();
    }
  }

  static Future<List<Results>> getKetoRecipes() async {
    String url =
        "https://api.spoonacular.com/recipes/complexSearch?diet=Ketogenic&maxFat=100&maxProtein=100&maxCarbs=200&number=30&apiKey=${ApiKey}";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var meals = json.decode(response.body);
      //   print(meals);
      Response_Model RM = Response_Model.fromJson(meals);
      return RM.results!;
    } else {
      throw Exception();
    }
  }

  //this function will provide all suggestions
  static Future<List<FoodResults>> getFoodSuggestion({String? query}) async {
    String baseUrl =
        "https://api.spoonacular.com/food/ingredients/search?query=";
    String parameter = "&number=10&sort=calories&sortDirection=desc&apiKey=";
    http.Response response =
        await http.get(Uri.parse('$baseUrl$query$parameter$ApiKey'));
    if (response.statusCode == 200) {
      var meals = json.decode(response.body);
      Food_Item food_item = Food_Item.fromJson(meals);

      return food_item.results!;
    } else {
      throw Exception();
    }
  }

  static Future<List<FoodNutrients>> getFoodNutrition({int? id}) async {
    String baseUrl = "https://api.spoonacular.com/food/ingredients/";
    String parameter = "/information?amount=1&apiKey=";
    http.Response response =
        await http.get(Uri.parse('$baseUrl$id$parameter$ApiKey'));
    if (response.statusCode == 200) {
      var meals = json.decode(response.body);
      Food_Info food_info = Food_Info.fromJson(meals);

      List<FoodNutrients>? nutrients = food_info.nutrition!.nutrients;
      double? carbs = nutrients![6].amount;
      double? Calories = nutrients[18].amount;
      return nutrients;
    } else {
      throw Exception();
    }
  }

  static Future<RecipeInfo> getRecipeNutrition({String? title}) async {
    String baseUrl =
        "https://api.spoonacular.com/recipes/guessNutrition?title=";

    http.Response response =
        await http.get(Uri.parse('$baseUrl$title${"&apiKey="}$ApiKey'));
    if (response.statusCode == 200) {
      var recipeNutrients = json.decode(response.body);

      RecipeInfo food_info = RecipeInfo.fromJson(recipeNutrients);
      double? calories = food_info.calories!.value;
      double? carb = food_info.carbs!.value;

      return food_info;
    } else {
      throw Exception();
    }
  }

  static Future<RecipePageInfo> getRecipeInform({int? id}) async {
    String baseUrl = "https://api.spoonacular.com/recipes/";
    String parameter = "/information?includeNutrition=true&apiKey=";
    http.Response response =
        await http.get(Uri.parse('$baseUrl$id$parameter$ApiKey'));
    if (response.statusCode == 200) {
      var recipeInfo = json.decode(response.body);
      print(recipeInfo);
      RecipePageInfo RecipeInform = RecipePageInfo.fromJson(recipeInfo);
      return RecipeInform;
    } else {
      throw Exception();
    }
  }
}
