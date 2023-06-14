import 'package:flutter/material.dart';
import 'package:last_test_app/pages/main_page.dart';

abstract class AppRoutes {
  static const String homePage = '/';
  static const String categoryPage = '/category';
  static const String cartPage = '/basket';
  static const String menuPage = '/menu';
  const AppRoutes._();
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => const MainPage());
      case categoryPage:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => const MainPage(isCategory: true,));

      default:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => const MainPage());
    }
  }
}
