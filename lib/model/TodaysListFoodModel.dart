class TodaysListFoodModel{
    int? id;
  String? title;
  String? image;
  double? calories;
  double? carb;
  double? fat;
  double? protein;
 

  TodaysListFoodModel({
   this.id,
   this.calories,
 this.carb,
  this.title,
   this.fat,
   this.protein,
   this.image
  });

 factory TodaysListFoodModel.fromJson(Map<String,dynamic> json){
  
   return TodaysListFoodModel(
      id: json['json'],
        calories: json['calories'],
        carb: json['carb'],
        title: json['title'],
        fat: json['fat'],
        protein: json['protein'],
        image: json['image']

      );
    
  }
  
  static Map<String,dynamic> tojson({TodaysListFoodModel? model}){
    Map<String,dynamic> map=<String,dynamic>{};
      map['id']=model!.id;
  map['calories']=model.calories;
  map['carb']=model.carb;
  map['protein']=model.protein;
  map['title']=model.title;
  map['fat']=model.fat;
  map['image']=model.image;
  
 return map;
  }
}