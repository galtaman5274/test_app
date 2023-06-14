import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'dishes.g.dart';


@RestApi(baseUrl:"https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b")
abstract class RestDishes {
  factory RestDishes(Dio dio, {String baseUrl}) = _RestDishes;

  @GET("/")
  Future<Dishes> getDishes();
}

@JsonSerializable()
class Dishes {
  List<Dish> dishes;

  Dishes({
    required this.dishes,
  });

  factory Dishes.fromJson(Map<String, dynamic> json) => _$DishesFromJson(json);

  Map<String, dynamic> toJson() => _$DishesToJson(this);
}

class Dish {
  int id;
  String name;
  int price;
  int weight;
  String description;
  String imageUrl;
  List<Teg> tegs;

  Dish({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.imageUrl,
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

enum Teg { ALL, WITH_FISH, SALADS, WITH_RICE }

final tegValues = EnumValues({
  "Все меню": Teg.ALL,
  "С рыбой": Teg.WITH_FISH,
  "Салаты": Teg.SALADS,
  "С рисом": Teg.WITH_RICE
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