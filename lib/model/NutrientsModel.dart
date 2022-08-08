import 'dart:convert';

class NutrientsModel{
  int? id;
  double? calories;
  double? carb;
  List<String>? titles;

  NutrientsModel({
   this.id,
  required  this.calories,
  required this.carb,
  required this.titles,
  });

 factory NutrientsModel.fromJson(Map<String,dynamic> json){
  String listtitle=json['titles'];
   return NutrientsModel(
   //id=json['id'];
    calories:json['calories'],
     carb:json['carb'],
   //String titl=json['titles'],
      titles:listtitle.split(','),
      );
    
  }
  
  static Map<String,dynamic> tojson({NutrientsModel? model}){
    Map<String,dynamic> map=<String,dynamic>{};
      map['id']=model!.id;
  map['calories']=model.calories;
  map['carb']=model.carb;
  String titles=jsonEncode(model.titles);
  map['titles']=titles;
 return map;
  }
}