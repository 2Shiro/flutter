import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/common.utils/logger.dart';

import 'book_cart_page.dart';
import 'book_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  List<String> mySelectedBook = [];

  void _toggleSaveStates(String book) {
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
    logger.d('HomeScreen build method 호출!');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('상태관리'),
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        body: IndexedStack(
          index: pageIndex,
          children: [
            BookListPage(
              onToggleSaved: _toggleSaveStates,
              selectedBook: mySelectedBook,
            ),
            BookCartPage(mySelectedBook),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'book-list'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'cart'),
          ],
        ),
      ),
    );
  }
}
