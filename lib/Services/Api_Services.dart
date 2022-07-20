import 'dart:convert';

import '../model/Meal.dart';
import 'package:http/http.dart' as http;

class Api_Services{
static String baseUrl="https://api.spoonacular.com/recipes/complexSearch?query=";
static String ApiKey="c020b400a8244106a0b807006800605b";
static String parameter="&maxFat=100&maxProtein=100&maxCarbs=200&number=10&apiKey=";

//https://api.spoonacular.com/recipes/complexSearch?query=Pasta%20With%20Tuna&maxFat=100&maxProtein=100&maxCarbs=200&number=10&apiKey=c020b400a8244106a0b807006800605b

 static Future<Meal?> getMeal({String? query}) async {
    try {
      http.Response response = await http.get(Uri.parse('$baseUrl$query$parameter$ApiKey'));
      print(response.body);
         var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
         print(jsonResponse);
      return Meal.fromjson(jsonResponse);
    } catch (e) {
      print(e.toString());
    }
  }

 static Future<List<Meal>> getMealSuggestion({String? query})async{
      print("in get suggestion function");
      http.Response response = await http.get(Uri.parse('$baseUrl$query$parameter$ApiKey'));
      print("Showing response.body ki print statement");
      print(response.body);
   if (response.statusCode==200) {
      final List Meals = json.decode(response.body);
     return Meals.map((json) => Meal.fromjson(json))
     .where((meal){
      final lowerTitle=meal.title!.toLowerCase();
      final lowerQuery=query!.toLowerCase();
      return lowerTitle.contains(lowerQuery);
     }
     ).toList();
  }
    else {
      print("in else exception occured");
    throw Exception();  
   }
  }
}