import 'package:flutter/material.dart';
import 'package:last_test_app/pages/basket_page/basket_page.dart';
import 'package:last_test_app/pages/category_page/category_page.dart';
import 'package:last_test_app/pages/home_page/home_page.dart';
import 'package:last_test_app/utils/constants/strings.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.isCategory = false}) : super(key: key);
  final bool isCategory;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> mainWidgets = [
      if (!widget.isCategory) const HomePage() else const CategoryPage(),
      Container(),
      const BasketPage(),
      Container()
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.location_on_outlined,
          size: 30,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/accountphoto.jpg')),
          )
        ],
        centerTitle: false,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Бишкек',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(
              '8 Июнь, 2023 ',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: BottomNavBar.main),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: BottomNavBar.search),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              label: BottomNavBar.basket),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: BottomNavBar.profile),
        ],
      ),
      body: mainWidgets[_selectedIndex],
    );
  }
}
