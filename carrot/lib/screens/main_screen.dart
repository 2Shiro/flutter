import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chatting/chatting_page.dart';
import 'home/home_page.dart';
import 'my_carrot/my_carrot_page.dart';
import 'near_me/near_me_page.dart';
import 'neighborhood_life/neighborhood_life_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void changeStackPages(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            HomePage(),
            NeighborhoodLifePage(),
            NearMePage(),
            ChattingPage(),
            MyCarrotPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            changeStackPages(index);
          },
          items: [
            BottomNavigationBarItem(
              label: '홈',
              icon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(
              label: '동네생활',
              icon: Icon(CupertinoIcons.square_on_square),
            ),
            BottomNavigationBarItem(
              label: '내 근처',
              icon: Icon(CupertinoIcons.placemark),
            ),
            BottomNavigationBarItem(
              label: '채팅',
              icon: Icon(CupertinoIcons.chat_bubble_2),
            ),
            BottomNavigationBarItem(
              label: '나의 당근',
              icon: Icon(CupertinoIcons.person),
            ),
          ],
        ),
      ),
    );
  }
}
