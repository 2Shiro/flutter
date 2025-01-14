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
      home: ParentsView(),
    );
  }
}

// 부모 클래스
class ParentsView extends StatefulWidget {
  const ParentsView({super.key});

  @override
  State<ParentsView> createState() => _ParentsViewState();
}

class _ParentsViewState extends State<ParentsView> {
  String displayText = '여기는 부모 위젯 변수야';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(flex: 1, child: Text(displayText)),
            Expanded(flex: 2, child: ChildA()),
            Expanded(flex: 2, child: ChildB()),
          ],
        ),
      ),
    );
  }
}

// 자식 a
class ChildA extends StatelessWidget {
  const ChildA({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child a 에 이벤트 발생');
        },
        child: Container(
          width: double.infinity, // 부모 크기 안에서 최대로 확장
          color: Colors.orange,
          child: Align(
            alignment: Alignment.center,
            child: Text('CHILD A'),
          ),
        ),
      ),
    );
  }
}

// 자식 b
class ChildB extends StatelessWidget {
  const ChildB({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child b 에 이벤트 발생');
        },
        child: Container(
          width: double.infinity, // 부모 크기 안에서 최대로 확장
          color: Colors.red,
          child: Align(
            alignment: Alignment.center,
            child: Text('CHILD B'),
          ),
        ),
      ),
    );
  }
}
