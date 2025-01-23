import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyStatefulWidget()));
}

// stateful
// 사실 상태는 변수에 할당된 값이다. 상태가 있다는 말은 값들이 변화할 수 있는 가능성을 이야기 한다.

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // final 변수지만 고정되어 변하지 않는 값은 = 상수
  final msg = 'stateful 위젯입니다.';

  // 변수에 할당된 값이 상수가 아니기 때문에 언제든지 변경 가능 (상태 변수)
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => {
            setState(() {
              count += 1;
            })
          },
          child: Text('${msg} onTap Count : ${count}'),
        ),
      ),
    );
  }
}
