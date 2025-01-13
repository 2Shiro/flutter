import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DeckPage(),
    );
  }
}

class DeckPage extends StatelessWidget {
  const DeckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('덱 목록'), // 타이틀 추가
        centerTitle: true, // 타이틀 중앙 정렬
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                '메뉴',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('항목 1'),
              onTap: () {
                // 항목 1 클릭 시 동작
                Navigator.pop(context); // 드로어 닫기
              },
            ),
            ListTile(
              title: Text('항목 2'),
              onTap: () {
                // 항목 2 클릭 시 동작
                Navigator.pop(context); // 드로어 닫기
              },
            ),
            ListTile(
              title: Text('항목 3'),
              onTap: () {
                // 항목 3 클릭 시 동작
                Navigator.pop(context); // 드로어 닫기
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // 아이템의 최대 너비
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: 22,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(15), // 모서리 둥글게
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // 그림자 색상
                  spreadRadius: 2, // 그림자 확산 정도
                  blurRadius: 5, // 그림자 흐림 정도
                  offset: Offset(0, 3), // 그림자 위치
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 이미지로 교체
                Image.asset(
                  'assets/images/box_icon.png',
                  width: 77, // 이미지 너비
                  height: 77, // 이미지 높이
                ),
                // 숫자 텍스트를 아래에 배치
                Positioned(
                  bottom: 10, // 숫자를 아래로 이동
                  child: Text(
                    '${index}',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
