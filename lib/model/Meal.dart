
class Meal {
int? id;
String? title;
 String? image;
 String? carbs;
 String? fat;
  String? protein;
  Meal({required this.id,required this.title,required this.image,required this.carbs,required this.fat,required this.protein});  

  static Meal fromjson(Map<String,dynamic> json){
   return Meal(
    id: json['id'], 
    title: json['title'], 
    image: json['image'], 
    carbs: json['nutrients']['Carbohydrates'], 
    fat: json['nutrients']['Fat'], 
    protein:json['nutrients']['Frotein'],
  
    )  ;
    }

}