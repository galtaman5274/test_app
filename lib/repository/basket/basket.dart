import '../categories/dishes.dart';

class CartRepo {
  List<Dish> cart = [];
  void addToCart(Dish item) {
    cart.add(item);
  }

  void removeFromCart(Dish item) {
    cart.remove(item);
  }
  
}
