import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common.utils/logger.dart';
import 'todo.dart';

// riverPod 적용 순서
void main() {
  // 1. ProviderScope로 감싸기
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
    );
  }
}

// 2. 위젯을 ConsumerWidget으로 만들면 ProviderScope에 접근 가능
class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  // 3. ComsumerWidget 클래스의 build 메서드는 WidgetRef를 참조
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 4. ref를 통해서 ProviderScope가 관리하는 데이터에 접근 가능
    // 5. ref.read() 메서드 -> 데이터에 접근하거나 상태값을 한 번만 수신할 때 사용
    // 6. ref.watch() 메서드 -> 상태값이 변경되는 것을 계속 수신할 때 사용
    // 7. 여러명의 창고 관리자 중 Provider라는 창고관리자를 사용
    Todo todo = ref.read(todoProvider);
    logger.d('Todo 확인 : ${todo.toString()}');
    return Scaffold(
      body: Center(
        child: Text('완료 : ${todo.isCompleted} ${todo.description}'),
      ),
    );
  }
}
