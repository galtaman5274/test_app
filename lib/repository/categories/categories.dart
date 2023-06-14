import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'categories.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54")
abstract class RestCategories {
  factory RestCategories(Dio dio, {String baseUrl}) = _RestCategories;

  @GET("/")
  Future<Categories> getCategories();
}
@JsonSerializable()
class Categories {
  List<Category> categories;

  Categories({
    required this.categories,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}

class Category {
  int id;
  String name;
  String imageUrl;
  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

   factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
      };
}