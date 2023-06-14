import 'package:flutter/material.dart';
import 'package:last_test_app/utils/routes/routes.dart';
class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.categoryPage);
        },
        child: Stack(alignment: Alignment.center, children: [
          Image.asset(image,fit: BoxFit.fill,),
          Positioned.fill(
              left: 10,
              top: 10,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )))
        ]),
      ),
    );
  }
}
