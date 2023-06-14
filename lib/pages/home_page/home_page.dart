import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_test_app/blocs/categories/catalog_bloc.dart';

import 'components/menu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (BuildContext context, state) {
        if (state is CatalogLoaded) {
          final categories = state.categories;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder:  (context, index) => MenuCard(title: categories[index].name, image: categories[index].imageUrl,));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
