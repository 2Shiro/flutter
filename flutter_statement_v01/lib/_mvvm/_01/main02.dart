import 'package:flutter/material.dart';

void main() {
  runApp(MyApp02());
}

class MyApp02 extends StatelessWidget {
  const MyApp02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

// View Model
class HomeViewModel {
  int _counter = 0;

  int get counter => _counter;

  // 데이터를 변경하는 기능
  void incrementCounter() {
    _counter++;
  }
}

// View
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // View는 View Model만 바라보면 된다.
  // 컴포지션 관계 - 내부에서 객체를 생성 -> 강한 소유의 관계
  final HomeViewModel homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('뷰 모델이 없는 코드 작성 중')),
      body: Column(
        children: [
          Text('${homeViewModel.counter}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // 프레젠테이션 로직
              setState(() {
                homeViewModel.incrementCounter();
              });
            },
            child: Text('증가'),
          ),
        ],
      ),
    );
  }
}
