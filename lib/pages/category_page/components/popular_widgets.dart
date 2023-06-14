import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_test_app/repository/categories/dishes.dart';

import '../../../blocs/basket/cart_bloc.dart';
import '../../../blocs/dishes/dishes_bloc.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({Key? key}) : super(key: key);

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  List<Dish>? menus;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          children: [
            BlocBuilder<DishesBloc, DishesState>(
              builder: (BuildContext context, state) {
                if (state is DishesLoaded) {
                  final dishes = state.dishes;
                  return GridView.builder(
                      scrollDirection: Axis.vertical,
                      //default                 //default
                      controller: ScrollController(),
                      shrinkWrap: true,
                      //padding: const EdgeInsets.all(5.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 2.0,
                        //crossAxisSpacing: 3.0,
                      ),
                      itemCount: dishes.length,
                      itemBuilder: (context, index) => PopularCards(
                            image: dishes[index].imageUrl,
                            name: dishes[index].name,
                            dish: dishes[index],
                          ));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PopularCards extends StatelessWidget {
  PopularCards(
      {super.key,
      // required this.image,
      required this.name,
      required this.image,
      required this.dish});

  // Image image;
  String name;
  String image;
  Dish dish;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buildShowDialog(context, dish);
      },
      child: Column(
        // alignment: Alignment.center,
        children: [
          Container(
            color: Colors.white70,
            child: SizedBox(
              height: 75,
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> buildShowDialog(BuildContext context, Dish dish) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              insetPadding: const EdgeInsets.all(16),
              actions: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Stack(children: [
                          Positioned(
                              right: 50,
                              left: 50,
                              child: Image.network(image, fit: BoxFit.fill)),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_border_outlined)),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.close)),
                              ],
                            ),
                          )
                        ]),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Рыба с овощами и рисом',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '799 сом',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '560г',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Рыба маринованная со специями, лимонным соком, соевым соусом и запечeнная'
                        ' в духовке с лучком, томатами и картошечкой под золотистой майонезно-сырной шубкой',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<CartBloc>().add(CartItemAdded(dish));
                        },
                        child: Text('Добавить в корзину'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          padding: EdgeInsets.symmetric(
                              horizontal: 85, vertical: 15),
                        )))
              ],
            ));
  }
}
