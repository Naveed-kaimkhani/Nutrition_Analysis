import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nutritionanalysis/model/Response_Model.dart';

class Api_Services {
  static String baseUrl =
      "https://api.spoonacular.com/recipes/complexSearch?query=";
  static String ApiKey = "c020b400a8244106a0b807006800605b";
  static String parameter =
      "&maxFat=100&maxProtein=100&maxCarbs=200&number=10&apiKey=";

//https://api.spoonacular.com/recipes/complexSearch?query=Pasta%20With%20Tuna&maxFat=100&maxProtein=100&maxCarbs=200&number=10&apiKey=c020b400a8244106a0b807006800605b

  //this function will provide all suggestions
  static Future<List<Results>> getMealSuggestion({String? query}) async {
  
    http.Response response =
        await http.get(Uri.parse('$baseUrl$query$parameter$ApiKey'));
    if (response.statusCode == 200) {
      print("ab tk koii error nh");
     var meals =
          json.decode(response.body); //  Meals will have data in Map
       // print(meals);
          Response_Model RM=Response_Model.fromJson(meals);
          List<Results> results=RM.results!;

        return RM.results!;
      
    } else {
      throw Exception();
    }
  }
}
