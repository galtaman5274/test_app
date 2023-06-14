import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_test_app/blocs/basket/cart_bloc.dart';
import 'package:last_test_app/repository/categories/dishes.dart';

class OrderCard extends StatefulWidget {
  OrderCard({
    required this.name,
    required this.image,
    required this.price,
    required this.kg,
    this.amount = 1,
    required this.dish,
    super.key,
  });

  final String image;
  final String name;
  final int price;
  final int kg;
  int amount;
  final Dish dish;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        height: 80,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Image.network(widget.image),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name),
                  Row(
                    children: [
                      Text('${widget.price} сом'),
                      SizedBox(width: 8),
                      Text(
                        '${widget.kg}г',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            width: 110,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(CartItemRemoved(widget.dish));
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(
                  '1',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(CartItemAdded(widget.dish));
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          )
        ]));
  }
}
