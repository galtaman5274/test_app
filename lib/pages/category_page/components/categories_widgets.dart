import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_test_app/blocs/dishes/dishes_bloc.dart';
import 'package:last_test_app/repository/categories/dishes.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 15,
        ),
        child: Row(
          children: [
            // for (int i = 0; i < 4; i++)
            CatWid(
              cardText: 'Все меню',
              isActive: true,
              teg: Teg.ALL,
            ),
            CatWid(
              cardText: 'Салаты',
              teg: Teg.SALADS,
            ),
            CatWid(
              cardText: 'С рисом',
              teg: Teg.WITH_RICE,
            ),
            CatWid(
              cardText: 'С рыбой',
              teg: Teg.WITH_FISH,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CatWid extends StatefulWidget {
  CatWid(
      {super.key,
      required this.cardText,
      this.isActive = false,
      required this.teg});

  String cardText;
  bool isActive;
  Teg teg;

  @override
  State<CatWid> createState() => _CatWidState();
}

class _CatWidState extends State<CatWid> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isActive = !widget.isActive;
        setState(() {});
        context.read<DishesBloc>().add(DishesFiltered(teg: widget.teg));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
              color: widget.isActive ? Colors.blue : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 2,
                    offset: const Offset(1, 2))
              ]),
          child: Text(widget.cardText, style: const TextStyle()),
        ),
      ),
    );
  }
}
