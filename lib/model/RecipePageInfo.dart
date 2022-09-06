class RecipePageInfo {
  int? id;
  String? title;
  String? image;
  String? imageType;
  int? servings;
  int? readyInMinutes;
  String? license;
  String? sourceName;
  String? sourceUrl;
  String? spoonacularSourceUrl;
  int? aggregateLikes;
  int? healthScore;
  int? spoonacularScore;
  double? pricePerServing;
 // List<Null> analyzedInstructions;
  bool? cheap;
  String? creditsText;
 // List<Null> cuisines;
  bool? dairyFree;
 // List<Null> diets;
  String? gaps;
  bool? glutenFree;
  String? instructions;
  bool? ketogenic;
  bool? lowFodmap;
 // List<Null> occasions;
  bool? sustainable;
  bool? vegan;
  bool? vegetarian;
  bool? veryHealthy;
  bool? veryPopular;
  bool? whole30;
  int? weightWatcherSmartPoints;
  List<dynamic>? dishTypes;
  List<ExtendedIngredients>? extendedIngredients;
  String? summary;
    Nutrition? nutrition;

  WinePairing? winePairing;

  RecipePageInfo(
      {required this.id,
      required       this.nutrition,

     required this.title,
    required  this.image,
    required  this.imageType,
    required  this.servings,
     required this.readyInMinutes,
     required this.license,
     required this.sourceName,
     required this.sourceUrl,
     required this.spoonacularSourceUrl,
   required   this.aggregateLikes,
   required   this.healthScore,
   required   this.spoonacularScore,
     required this.pricePerServing,
   // required  this.analyzedInstructions,
    required  this.cheap,
   required   this.creditsText,
    // required this.cuisines,
  required    this.dairyFree,
  //  required  this.diets,
   required   this.gaps,
   required   this.glutenFree,
  required    this.instructions,
    required  this.ketogenic,
  required    this.lowFodmap,
 //   required  this.occasions,
     required this.sustainable,
   required   this.vegan,
  required    this.vegetarian,
 required     this.veryHealthy,
    required  this.veryPopular,
   required   this.whole30,
required      this.weightWatcherSmartPoints,
 required     this.dishTypes,
 required     this.extendedIngredients,
    required  this.summary,
     required this.winePairing});

  RecipePageInfo.fromJson(Map<String, dynamic> json) {
   // print("in Recipe page info from json");
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
    servings = json['servings'];
    readyInMinutes = json['readyInMinutes'];
    license = json['license'];
    sourceName = json['sourceName'];
    sourceUrl = json['sourceUrl'];
    spoonacularSourceUrl = json['spoonacularSourceUrl'];
    aggregateLikes = json['aggregateLikes'];
    healthScore = json['healthScore'];
    spoonacularScore = json['spoonacularScore'];
    pricePerServing = json['pricePerServing'];
    nutrition = (json['nutrition'] != null
        ? new Nutrition.fromJson(json['nutrition'])
        : null)!;
    // if (json['analyzedInstructions'] != null) {
    //   analyzedInstructions = new List<Null>();
    //   json['analyzedInstructions'].forEach((v) {
    //     analyzedInstructions.add(new Null.fromJson(v));
    //   });
    // }
    cheap = json['cheap'];
    creditsText = json['creditsText'];
    // if (json['cuisines'] != null) {
    //   cuisines = <Null>[];
    //   json['cuisines'].forEach((v) {
    //     cuisines.add(new Null.fromJson(v));
    //   });
    // }
    dairyFree = json['dairyFree'];
    // if (json['diets'] != null) {
    //   diets = new List<Null>();
    //   json['diets'].forEach((v) {
    //     diets.add(new Null.fromJson(v));
    //   });
    // }
    gaps = json['gaps'];
    glutenFree = json['glutenFree'];
    instructions = json['instructions'];
    ketogenic = json['ketogenic'];
    lowFodmap = json['lowFodmap'];
    // if (json['occasions'] != null) {
    //   occasions = new List<Null>();
    //   json['occasions'].forEach((v) {
    //     occasions.add(new Null.fromJson(v));
    //   });
    // }
    sustainable = json['sustainable'];
    vegan = json['vegan'];
    vegetarian = json['vegetarian'];
    veryHealthy = json['veryHealthy'];
    veryPopular = json['veryPopular'];
    whole30 = json['whole30'];
    weightWatcherSmartPoints = json['weightWatcherSmartPoints'];
    dishTypes = json['dishTypes'];
    if (json['extendedIngredients'] != null) {
      extendedIngredients = <ExtendedIngredients>[];
      json['extendedIngredients'].forEach((v) {
        extendedIngredients!.add(new ExtendedIngredients.fromJson(v));
      });
    }
    summary = json['summary'];
    winePairing = (json['winePairing'] != null
        ? new WinePairing.fromJson(json['winePairing'])
        : null)!;
       // print("leaving Recipe page info from json");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    data['servings'] = this.servings;
    data['readyInMinutes'] = this.readyInMinutes;
    data['license'] = this.license;
    data['sourceName'] = this.sourceName;
    data['sourceUrl'] = this.sourceUrl;
    data['spoonacularSourceUrl'] = this.spoonacularSourceUrl;
    data['aggregateLikes'] = this.aggregateLikes;
    data['healthScore'] = this.healthScore;
    data['spoonacularScore'] = this.spoonacularScore;
    data['pricePerServing'] = this.pricePerServing;
    // if (this.analyzedInstructions != null) {
    //   data['analyzedInstructions'] =
    //       this.analyzedInstructions.map((v) => v.toJson()).toList();
    // }
    data['cheap'] = this.cheap;
    data['creditsText'] = this.creditsText;
    // if (this.cuisines != null) {
    //   data['cuisines'] = this.cuisines.map((v) => v.toJson()).toList();
    // }
    data['dairyFree'] = this.dairyFree;
    // if (this.diets != null) {
    //   data['diets'] = this.diets.map((v) => v.toJson()).toList();
    // }
    data['gaps'] = this.gaps;
    data['glutenFree'] = this.glutenFree;
    data['instructions'] = this.instructions;
    data['ketogenic'] = this.ketogenic;
    data['lowFodmap'] = this.lowFodmap;
    // if (this.occasions != null) {
    //   data['occasions'] = this.occasions.map((v) => v.toJson()).toList();
    // }
    data['sustainable'] = this.sustainable;
    data['vegan'] = this.vegan;
    data['vegetarian'] = this.vegetarian;
    data['veryHealthy'] = this.veryHealthy;
    data['veryPopular'] = this.veryPopular;
    data['whole30'] = this.whole30;
    data['weightWatcherSmartPoints'] = this.weightWatcherSmartPoints;
    data['dishTypes'] = this.dishTypes;
    if (this.extendedIngredients != null) {
      data['extendedIngredients'] =
          this.extendedIngredients!.map((v) => v.toJson()).toList();
    }
    data['summary'] = this.summary;
    if (this.winePairing != null) {
      data['winePairing'] = this.winePairing!.toJson();
    }
    return data;
  }
}

class ExtendedIngredients {
  String? aisle;
  double? amount;
  String? consitency;
  int? id;
  String? image;
  Measures? measures;
  List<String>? meta;
  String? name;
  String? original;
  String? originalName;
  String? unit;

  ExtendedIngredients(
      {required this.aisle,
     required  this.amount,
  required     this.consitency,
required      this.id,
  required    this.image,
   required   this.measures,
 required     this.meta,
   required   this.name,
 required     this.original,
   required   this.originalName,
  required    this.unit});

  ExtendedIngredients.fromJson(Map<String, dynamic> json) {
    aisle = json['aisle'];
    amount = json['amount'];
    consitency = json['consitency'];
    id = json['id'];
    image = json['image'];
    measures = (json['measures'] != null
        ? new Measures.fromJson(json['measures'])
        : null)!;
    //meta = json['meta'];
    name = json['name'];
    original = json['original'];
    originalName = json['originalName'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aisle'] = this.aisle;
    data['amount'] = this.amount;
    data['consitency'] = this.consitency;
    data['id'] = this.id;
    data['image'] = this.image;
    if (this.measures != null) {
      data['measures'] = this.measures!.toJson();
    }
    data['meta'] = this.meta;
    data['name'] = this.name;
    data['original'] = this.original;
    data['originalName'] = this.originalName;
    data['unit'] = this.unit;
    return data;
  }
}

class Measures {
  Metric? metric;
  Metric? us;

  Measures({required this.metric,required this.us});

  Measures.fromJson(Map<String, dynamic> json) {
    metric =
        (json['metric'] != null ? new Metric.fromJson(json['metric']) : null)!;
    us = (json['us'] != null ? new Metric.fromJson(json['us']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metric != null) {
      data['metric'] = this.metric!.toJson();
    }
    if (this.us != null) {
      data['us'] = this.us!.toJson();
    }
    return data;
  }
}

class Metric {
  double? amount;
  String? unitLong;
  String? unitShort;

  Metric( {required this.amount,required this.unitLong,required this.unitShort});

  Metric.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    unitLong = json['unitLong'];
    unitShort = json['unitShort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['unitLong'] = this.unitLong;
    data['unitShort'] = this.unitShort;
    return data;
  }
}

class WinePairing {
  List<String>? pairedWines;
  String? pairingText;
  List<ProductMatches>? productMatches;

  WinePairing({required this.pairedWines,required this.pairingText,required this.productMatches});

  WinePairing.fromJson(Map<String, dynamic> json) {
    pairedWines = json['pairedWines'];
    pairingText = json['pairingText'];
    if (json['productMatches'] != null) {
      productMatches = <ProductMatches>[];
      json['productMatches'].forEach((v) {
        productMatches!.add(new ProductMatches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pairedWines'] = this.pairedWines;
    data['pairingText'] = this.pairingText;
    if (this.productMatches != null) {
      data['productMatches'] =
          this.productMatches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductMatches {
  int? id;
  String? title;
  String? description;
  String? price;
  String? imageUrl;
  double? averageRating;
  int? ratingCount;
  double? score;
  String? link;

  ProductMatches(
      {required this.id,
    required this.title,
    required  this.description,
  required    this.price,
    required  this.imageUrl,
  required    this.averageRating,
  required    this.ratingCount,
    required  this.score,
    required  this.link});

  ProductMatches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    averageRating = json['averageRating'];
    ratingCount = json['ratingCount'];
    score = json['score'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['averageRating'] = this.averageRating;
    data['ratingCount'] = this.ratingCount;
    data['score'] = this.score;
    data['link'] = this.link;
    return data;
  }
}

  class Nutrition {
  List<Nutrients>? nutrients;
  List<Properties>? properties;
  // List<Flavonoids> flavonoids;
  // List<Ingredients> ingredients;
  // CaloricBreakdown caloricBreakdown;
  // WeightPerServing weightPerServing;

  Nutrition(
      {this.nutrients,
      this.properties,
      // this.flavonoids,
      // this.ingredients,
      // this.caloricBreakdown,
      // this.weightPerServing
      });

  Nutrition.fromJson(Map<String, dynamic> json) {
    if (json['nutrients'] != null) {
      nutrients = <Nutrients>[];
      json['nutrients'].forEach((v) {
        nutrients!.add(new Nutrients.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(new Properties.fromJson(v));
      });
    }
    // if (json['flavonoids'] != null) {
    //   flavonoids = new List<Flavonoids>();
    //   json['flavonoids'].forEach((v) {
    //     flavonoids.add(new Flavonoids.fromJson(v));
    //   });
    // }
    // if (json['ingredients'] != null) {
    //   ingredients = new List<Ingredients>();
    //   json['ingredients'].forEach((v) {
    //     ingredients.add(new Ingredients.fromJson(v));
    //   });
    // }
    // caloricBreakdown = json['caloricBreakdown'] != null
    //     ? new CaloricBreakdown.fromJson(json['caloricBreakdown'])
    //     : null;
    // weightPerServing = json['weightPerServing'] != null
    //     ? new WeightPerServing.fromJson(json['weightPerServing'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nutrients != null) {
      data['nutrients'] = this.nutrients!.map((v) => v.toJson()).toList();
    }
    if (this.properties != null) {
      data['properties'] = this.properties!.map((v) => v.toJson()).toList();
    }
    // if (this.flavonoids != null) {
    //   data['flavonoids'] = this.flavonoids.map((v) => v.toJson()).toList();
    // }
    // if (this.ingredients != null) {
    //   data['ingredients'] = this.ingredients.map((v) => v.toJson()).toList();
    // }
    // if (this.caloricBreakdown != null) {
    //   data['caloricBreakdown'] = this.caloricBreakdown.toJson();
    // }
    // if (this.weightPerServing != null) {
    //   data['weightPerServing'] = this.weightPerServing.toJson();
    // }
    return data;
  }
}

class Nutrients {
  String? name;
  double? amount;
  String? unit;
  double? percentOfDailyNeeds;

  Nutrients({this.name, this.amount, this.unit, this.percentOfDailyNeeds});

  Nutrients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    data['percentOfDailyNeeds'] = this.percentOfDailyNeeds;
    return data;
  }
}

class Properties {
  String? name;
  double? amount;
  String? unit;

  Properties({this.name, this.amount, this.unit});

  Properties.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    return data;
  }
}
