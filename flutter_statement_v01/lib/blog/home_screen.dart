import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/blog/book.dart';
import 'package:flutter_statement_v01/blog/cart_page.dart';
import 'package:flutter_statement_v01/blog/list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  List<String> mySelectedBook = [];

  void _selectedBook(String book) {
    setState(() {
      if (mySelectedBook.contains(book)) {
        mySelectedBook.remove(book);
      } else {
        mySelectedBook.add(book);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('상태관리')),
        body: IndexedStack(
          index: pageIndex,
          children: [
            ListPage(
              onSelectedBook: _selectedBook,
              selectedBook: mySelectedBook,
            ),
            CartPage(mySelectedBook),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'list',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'cart',
            ),
          ],
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
