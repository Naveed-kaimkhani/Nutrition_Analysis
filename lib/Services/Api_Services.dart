import 'dart:convert';

import '../model/Meal.dart';
import 'package:http/http.dart' as http;

class Api_Services{
 String baseUrl="https://api.spoonacular.com/recipes/complexSearch?query=";
 String ApiKey="c020b400a8244106a0b807006800605b";
String parameter="&maxFat=100&maxProtein=100&maxCarbs=200&number=10";

//https://api.spoonacular.com/recipes/complexSearch?query=Pasta%20With%20Tuna&maxFat=100&maxProtein=100&maxCarbs=200&number=10&apiKey=c020b400a8244106a0b807006800605b

  Future<Meal?> getMeal({String? query}) async {
    try {
      http.Response response = await http.get(Uri.parse('$baseUrl$query$parameter$ApiKey'));
         var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return Meal.fromjson(jsonResponse);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Meal>> getMealSuggestion({String? query})async{
      http.Response response = await http.get(Uri.parse('$baseUrl$query$parameter$ApiKey'));
   if (response.statusCode==200) {
      final List Meals = json.decode(response.body);
     return Meals.map((item) => Meal.fromjson(item)).where((Meal){
      final lowerTitle=Meal.title!.toLowerCase();
      final lowerQuery=query!.toLowerCase();
      return lowerTitle.contains(lowerQuery);
     }).toList();
  }
    else {
    throw Exception();  
   }
  }
}