import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_test_app/services/basket/basket_service.dart';
import 'package:last_test_app/services/categories/categories_service.dart';
import 'package:last_test_app/services/categories/dishes_service.dart';
import 'package:last_test_app/utils/routes/routes.dart';
import 'blocs/basket/cart_bloc.dart';
import 'blocs/categories/catalog_bloc.dart';
import 'blocs/dishes/dishes_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => CategoryBloc(categoryService: CategoryService())
              ..add(CatalogStarted())),
        BlocProvider(
            create: (_) => DishesBloc(dishesService: DishesService())
              ..add(DishesStarted())),
              BlocProvider(
            create: (_) => CartBloc(basketRepository: BaskteService())
              ..add(CartStarted())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
