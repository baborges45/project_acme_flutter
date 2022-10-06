import 'package:flutter/material.dart';

import '../../../commons/resources/translation.dart';
import '../cart/view/cart_page.dart';
import '../dashboard/dashboard_page.dart';
import '../home/home_tab.dart';
import '../orders/orders_tab.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomeTab(),
          CartPage(),
          OrdersTab(),
          DashboardPage(),
        ],
      ),
      bottomNavigationBar: _makeBottomNavigatorBar(context),
    );
  }

  BottomNavigationBar _makeBottomNavigatorBar(BuildContext context) =>
      BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _changePage(index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: Translation.of(context).bottomHome,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: Translation.of(context).bottomShoppingCart,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: Translation.of(context).bottomOrderList,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq_outlined),
            label: Translation.of(context).bottomProfile,
          ),
        ],
      );

  void _changePage(int index) {
    setState(() {
      currentIndex = index;
      //_pageController.jumpToPage(index);
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }
}
