import 'package:flutter/material.dart';

import 'components/categories_widgets.dart';
import 'components/popular_widgets.dart';


class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const[CategoriesWidget(), PopularWidget()],
    );
  }
}
