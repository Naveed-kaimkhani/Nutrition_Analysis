class RecipeInfo {
  Calories? calories;
  Calories? fat;
  Calories? protein;
  Calories? carbs;

  RecipeInfo(
      {required this.calories,
      required this.fat,
      required this.protein,
      required this.carbs});

  RecipeInfo.fromJson(Map<String, dynamic> json) {
    calories = json['calories'] != null
        ? new Calories.fromJson(json['calories'])
        : null;
    fat = json['fat'] != null ? new Calories.fromJson(json['fat']) : null;
    protein =
        json['protein'] != null ? new Calories.fromJson(json['protein']) : null;
    carbs = json['carbs'] != null ? new Calories.fromJson(json['carbs']) : null;
  }
}

class Calories {
  double? value;
  String? unit;

  Calories({
    required this.value,
    required this.unit,
  });

  Calories.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }
}
