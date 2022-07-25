class Response_Model {
  List<Results>? results;

  Response_Model({required this.results});

  Response_Model.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      // ignore: deprecated_member_use
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

}

class Results {
  int? id;
  String? title;
  String? image;
  Nutrition? nutrition;

  Results({required this.id, required this.title, required this.image,required this.nutrition});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    nutrition = json['nutrition'] != null
        ? new Nutrition.fromJson(json['nutrition'])
        : null;
  }
}

class Nutrition {
  List<Nutrients>? nutrients;

  Nutrition({required this.nutrients});

  Nutrition.fromJson(Map<String, dynamic> json) {
    if (json['nutrients'] != null) {
      // ignore: deprecated_member_use
      nutrients = <Nutrients>[];
      json['nutrients'].forEach((v) {
        nutrients!.add(new Nutrients.fromJson(v));
      });
    }
  }

}

class Nutrients {
  String? name;
  double? amount;
  String? unit;

  Nutrients({required this.name, required this.amount, required this.unit});

  Nutrients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
  }
}
