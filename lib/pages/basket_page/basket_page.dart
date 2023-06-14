import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_test_app/blocs/basket/cart_bloc.dart';

import 'components/order_card.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (BuildContext context, state) {
        if (state is CartLoaded) {
          final cart = state.cart;
          final sum = cart.fold(0, (value, element) => value + element.price);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) => OrderCard(
                          image: cart[index].imageUrl,
                          name: cart[index].name,
                          price: cart[index].price,
                          kg: cart[index].weight,
                          dish: cart[index],
                        )),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Оплатить $sum P'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        padding:
                            EdgeInsets.symmetric(horizontal: 85, vertical: 15),
                      )))
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
