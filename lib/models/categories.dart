import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  List<Dish> dishes;

  Menu({
    required this.dishes,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        dishes: List<Dish>.from(json["dishes"].map((x) => Dish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dishes": List<dynamic>.from(dishes.map((x) => x.toJson())),
      };
}

class Dish {
  int id;
  String name;
  int price;
  int weight;
  String description;
  String? imageUrl;
  List<Teg> tegs;

  Dish({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    this.imageUrl,
    required this.tegs,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        weight: json["weight"],
        description: json["description"],
        imageUrl: json["image_url"],
        tegs: List<Teg>.from(json["tegs"].map((x) => tegValues.map[x]!)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "weight": weight,
        "description": description,
        "image_url": imageUrl,
        "tegs": List<dynamic>.from(tegs.map((x) => tegValues.reverse[x])),
      };
}

enum Teg { EMPTY, TEG, PURPLE, FLUFFY }

final tegValues = EnumValues({
  "Все меню": Teg.EMPTY,
  "С рыбой": Teg.FLUFFY,
  "Салаты": Teg.PURPLE,
  "С рисом": Teg.TEG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
