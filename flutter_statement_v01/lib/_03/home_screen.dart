import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/common.utils/logger.dart';

import 'book_cart_page.dart';
import 'book_list_page.dart';
import 'inherited_parent.dart';

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
        // Inherited의 state를 직접 수정하는 경우 updateShouldNotify가 변경 사항을 감지 못함
        // updateShouldNotify는 위젯의 새로운 인스턴스와 이전의 인스턴스를 비교
        // state를 직접 수정하는 경우 state의 참조는 그대로 유지되기 때문에 상태 변경됨을 감지 못함
        // !!참조가 동일하기 때문에!!
        // 리스트를 불변 데이터로 관리해서 상태가 변경될 때마다 새로운 리스트를 생성하는 방식
        mySelectedBook = List.from(mySelectedBook)..remove(book);
      } else {
        mySelectedBook = List.from(mySelectedBook)..add(book);
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
        body: InheritedParent(
          state: mySelectedBook,
          onPressed: _toggleSaveStates,
          child: IndexedStack(
            index: pageIndex,
            children: [
              BookListPage(),
              BookCartPage(),
            ],
          ),
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
