import 'package:last_test_app/repository/basket/basket.dart';

import '../../repository/categories/dishes.dart';

class BaskteService {
  final CartRepo cartRepo = CartRepo();

  void addToCart(Dish item) {
    cartRepo.cart.add(item);
  }

  void removeFromCart(Dish item) {
    cartRepo.cart.remove(item);
  }
}
