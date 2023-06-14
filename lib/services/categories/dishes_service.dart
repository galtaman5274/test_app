import 'package:dio/dio.dart';
import '../../repository/categories/dishes.dart';

class DishesService {
  final client = RestDishes(Dio());

  Future<List<Dish>> getDishes() async {
    final Dishes dishes = await client.getDishes();
    List<Dish> getAllDishes = dishes.dishes;
    return getAllDishes;
  }
}