// yml 문법 = 엄격한 문법
import 'package:flutter/material.dart'; // 플러터 동작시 반드시 필요

void main() {
  // 플러터는 거의 모든 것이 위젯
  // 전달된 위젯을 최상위 위젯으로 설정하고 앱을 시작하는 함수
  runApp(MyApp());
}

// stl 단축키 활용
class MyApp extends StatelessWidget {
  // 생성자 - 매개변수 : 선택적 명명 매개변수
  MyApp({super.key});

  // Flutter 를 개발할 때 맨 밑바닥부터 개발하는 것은 힘들다
  // 기본적인 개발을 할 수 있도록 매우 유용한 클래스를 제공한다.
  // MaterialApp
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StorePage(),
    );
  }
}

//
class StorePage extends StatelessWidget {
  StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 시각적 레이아웃 구조를 잡아주는 위젯이다.
    return Scaffold(
      body: SafeArea(
        child: Column(
          // 위젯은 자식 또는 자식들을 속성으로 가질 수 있다.
          children: [
            Padding(
              padding: EdgeInsets.all(25.0),
              // Row 위젯 : 자식 위젯들을 수평으로 정렬
              child: Row(
                children: [
                  Text(
                    'Woman',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'kids',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Shoes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Bag',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Expanded 위젯 : 자식 위젯을 가용 공간에 맞게 확장시켜 배치하는 위젯
            Expanded(
                child: Image.asset(
              'assets/bag.jpeg',
              fit: BoxFit.cover,
            )),
            // SizedBox 위젯은 고정된 크기의 빈 공간을 만들거나 자식 위젯의 크기를 제한할 때 사용한다.
            SizedBox(height: 2),
            Expanded(
                child: Image.asset(
              'assets/cloth.jpeg',
              fit: BoxFit.cover,
            )),
          ],
        ),
      ),
    );
  }
}
