
class Meal {
int? id;
String? title;
 String? Imageurl;
 String? carbs;
 String? fat;
  String? protein;
  Meal({required this.id,required this.title,required this.Imageurl,required this.carbs,required this.fat,required this.protein});  

//This class has an ID which allows us to get the Recipes and other info
//Such as title and Image URL

/*
Factory Constructor Meal.fromMap parses the decoded JSON data to get the 
values of the meal, and returns the Meal Object
*/

  static Meal fromjson(Map<String,dynamic> json){
   return Meal(
    id: json['id'], 
    title: json['title'], 
    Imageurl: json['image'], 
    carbs: json['nutrients']['Carbohydrates'], 
    fat: json['nutrients']['Fat'], 
    protein:json['nutrients']['Frotein'],
    )  ;
    }

}