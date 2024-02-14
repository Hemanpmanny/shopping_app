import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';
import 'package:shopping_app/product_list.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int currentvalue = 0;
  List<Widget> pages = [const product_list(), const Cart_page()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: pages[
      //     currentvalue], //currentvalue == 0 ? const product_list() : const Cart_page(),
      body: IndexedStack(
        index: currentvalue,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 34,
        currentIndex: currentvalue,
        onTap: (value) {
          setState(() {
            currentvalue = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'), //lable should not empty
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart')
        ],
      ),
    );
  }
}
