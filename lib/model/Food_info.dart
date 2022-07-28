class Food_Info {
  int? id;
  String? name;
  String? unit;
  String? image;
  FoodNutrition? nutrition;
  Food_Info({
    required this.id,
    required this.name,
    required this.unit,
    required this.image,
    required this.nutrition,
  });

  Food_Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'];
    image = json['image'];
    nutrition = json['nutrition'] != null
        ? new FoodNutrition.fromJson(json['nutrition'])
        : null;
  }
}

class FoodNutrition {
  List<FoodNutrients>? nutrients;
  FoodNutrition({
    required this.nutrients,
  });

  FoodNutrition.fromJson(Map<String, dynamic> json) {
    
    if (json['nutrients'] != null) {
      nutrients = <FoodNutrients>[];
      json['nutrients'].forEach((v) {
        nutrients!.add(new FoodNutrients.fromJson(v));
      });
    }
  }
}

class FoodNutrients {
  String? name;
  double? amount;
  String? unit;
  double? percentOfDailyNeeds;

  FoodNutrients({this.name, this.amount, this.unit, this.percentOfDailyNeeds});

  FoodNutrients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'];
  }
}
