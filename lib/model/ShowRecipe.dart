class ShowRecipe {
  List<Recipes>? recipes;

  ShowRecipe({this.recipes});

  ShowRecipe.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(new Recipes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipes != null) {
      data['recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipes {
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  int? weightWatcherSmartPoints;
  String? gaps;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  int? healthScore;
  String? creditsText;
  String? license;
  String? sourceName;
  double? pricePerServing;
  //List<ExtendedIngredients> extendedIngredients;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  String? summary;
  List<Null>? cuisines;
  List<String>? dishTypes;
  List<String>? diets;
  List<Null>? occasions;
  String? instructions;
  //List<AnalyzedInstructions> analyzedInstructions;
  Null? originalId;
  String? spoonacularSourceUrl;

  Recipes(
      {this.vegetarian,
      this.vegan,
      this.glutenFree,
      this.dairyFree,
      this.veryHealthy,
      this.cheap,
      this.veryPopular,
      this.sustainable,
      this.lowFodmap,
      this.weightWatcherSmartPoints,
      this.gaps,
      this.preparationMinutes,
      this.cookingMinutes,
      this.aggregateLikes,
      this.healthScore,
      this.creditsText,
      this.license,
      this.sourceName,
      this.pricePerServing,
      //this.extendedIngredients,
      this.id,
      this.title,
      this.readyInMinutes,
      this.servings,
      this.sourceUrl,
      this.image,
      this.imageType,
      this.summary,
      this.cuisines,
      this.dishTypes,
      this.diets,
      this.occasions,
      this.instructions,
      //this.analyzedInstructions,
      this.originalId,
      this.spoonacularSourceUrl});

  Recipes.fromJson(Map<String, dynamic> json) {
    vegetarian = json['vegetarian'];
    vegan = json['vegan'];
    glutenFree = json['glutenFree'];
    dairyFree = json['dairyFree'];
    veryHealthy = json['veryHealthy'];
    cheap = json['cheap'];
    veryPopular = json['veryPopular'];
    sustainable = json['sustainable'];
    lowFodmap = json['lowFodmap'];
    weightWatcherSmartPoints = json['weightWatcherSmartPoints'];
    gaps = json['gaps'];
    preparationMinutes = json['preparationMinutes'];
    cookingMinutes = json['cookingMinutes'];
    aggregateLikes = json['aggregateLikes'];
    healthScore = json['healthScore'];
    creditsText = json['creditsText'];
    license = json['license'];
    sourceName = json['sourceName'];
    pricePerServing = json['pricePerServing'];
    // if (json['extendedIngredients'] != null) {
    //   extendedIngredients = new List<ExtendedIngredients>();
    //   json['extendedIngredients'].forEach((v) {
    //     extendedIngredients.add(new ExtendedIngredients.fromJson(v));
    //   });
    //}
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
    image = json['image'];
    imageType = json['imageType'];
    summary = json['summary'];
    // if (json['cuisines'] != null) {
    //   cuisines = new List<Null>();
    //   json['cuisines'].forEach((v) {
    //     cuisines.add(new Null.fromJson(v));
    //   });
    // }
    dishTypes = json['dishTypes'].cast<String>();
    diets = json['diets'].cast<String>();
    // if (json['occasions'] != null) {
    //   occasions = new List<Null>();
    //   json['occasions'].forEach((v) {
    //     occasions.add(new Null.fromJson(v));
    //   });
    // }
    // instructions = json['instructions'];
    // if (json['analyzedInstructions'] != null) {
    //   analyzedInstructions = new List<AnalyzedInstructions>();
    //   json['analyzedInstructions'].forEach((v) {
    //     analyzedInstructions.add(new AnalyzedInstructions.fromJson(v));
    //   });
    // }
    originalId = json['originalId'];
    spoonacularSourceUrl = json['spoonacularSourceUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vegetarian'] = this.vegetarian;
    data['vegan'] = this.vegan;
    data['glutenFree'] = this.glutenFree;
    data['dairyFree'] = this.dairyFree;
    data['veryHealthy'] = this.veryHealthy;
    data['cheap'] = this.cheap;
    data['veryPopular'] = this.veryPopular;
    data['sustainable'] = this.sustainable;
    data['lowFodmap'] = this.lowFodmap;
    data['weightWatcherSmartPoints'] = this.weightWatcherSmartPoints;
    data['gaps'] = this.gaps;
    data['preparationMinutes'] = this.preparationMinutes;
    data['cookingMinutes'] = this.cookingMinutes;
    data['aggregateLikes'] = this.aggregateLikes;
    data['healthScore'] = this.healthScore;
    data['creditsText'] = this.creditsText;
    data['license'] = this.license;
    data['sourceName'] = this.sourceName;
    data['pricePerServing'] = this.pricePerServing;
    // if (this.extendedIngredients != null) {
    //   data['extendedIngredients'] =
    //       this.extendedIngredients.map((v) => v.toJson()).toList();
    // }
    data['id'] = this.id;
    data['title'] = this.title;
    data['readyInMinutes'] = this.readyInMinutes;
    data['servings'] = this.servings;
    data['sourceUrl'] = this.sourceUrl;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    data['summary'] = this.summary;
    // if (this.cuisines != null) {
    //   data['cuisines'] = this.cuisines.map((v) => v.toJson()).toList();
    // }
    data['dishTypes'] = this.dishTypes;
    data['diets'] = this.diets;
    // if (this.occasions != null) {
    //   data['occasions'] = this.occasions.map((v) => v.toJson()).toList();
    // }
    data['instructions'] = this.instructions;
    // if (this.analyzedInstructions != null) {
    //   data['analyzedInstructions'] =
    //       this.analyzedInstructions.map((v) => v.toJson()).toList();
    // }
    data['originalId'] = this.originalId;
    data['spoonacularSourceUrl'] = this.spoonacularSourceUrl;
    return data;
  }
}
