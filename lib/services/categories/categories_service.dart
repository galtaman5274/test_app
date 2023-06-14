import 'package:dio/dio.dart';
import 'package:last_test_app/repository/categories/categories.dart';

class CategoryService {
  final client = RestCategories(Dio());

  Future<List<Category>> getCategories() async {
    final Categories categories = await client.getCategories();
    List<Category> getAllCategories = categories.categories;
    return getAllCategories;
  }
}
