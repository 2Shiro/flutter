import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyStatelessWidget()));
}

// stateless
// 상태의 변화 없이 항상 동일한 UI를 그림
// 데이터나 변수의 값이 변하지 않을 때 사용

// 상태는 변수에 할당된 값

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  final msg = '안녕하세요. 상태가 없는 위젯입니다.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(msg),
      ),
    );
  }
}
