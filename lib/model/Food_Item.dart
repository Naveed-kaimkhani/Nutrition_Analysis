
//To get food suggestions
class Food_Item {
  List<FoodResults>? results;
 

  Food_Item({required this.results});

  Food_Item.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      // ignore: deprecated_member_use
      results = <FoodResults>[];
      json['results'].forEach((v) {
        results!.add(new FoodResults.fromJson(v));
      });
    }
  }

}

class FoodResults {
  int? id;
  String? name;
  String? image;

  FoodResults({required this.id,required this.name,required this.image});

  FoodResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}