import 'package:flutter/material.dart';
import '../components/appbar_preferred_size.dart';
import 'components/card_icon_menu.dart';
import 'components/my_carrot_header.dart';

class MyCarrotPage extends StatelessWidget {
  const MyCarrotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나의 당근'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
          )
        ],
        bottom: appBarBottomLine(),
      ),
      body: ListView(
        children: [
          MyCarrotHeader(),
          CardIconMenu(),
          // 아이콘 메뉴 1 - 카드 레이아웃
          // 아이콘 메뉴 2 - 카드 레이아웃
          // 아이콘 메뉴 3 - 카드 레이아웃
        ],
      ),
    );
  }
}
