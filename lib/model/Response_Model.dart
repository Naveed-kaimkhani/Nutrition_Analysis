class Response_Model {
  List<Results>? results;
 int? offset;
 int? number;
 int? totalResults;

  Response_Model({required this.results, required this.offset, required this.number, required this.totalResults});

  Response_Model.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      // ignore: deprecated_member_use
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }

}

class Results {
  int? id;
  String? title;
  String? image;
  String? imageType;
  Nutrition? nutrition;

  Results({required this.id, required this.title, required this.image, required this.imageType, required this.nutrition});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
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
