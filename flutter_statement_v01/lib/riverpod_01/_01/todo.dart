import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final bool isCompleted;
  final String description;

  Todo({required this.isCompleted, required this.description});

  @override
  String toString() {
    return 'Todo{isCompleted: $isCompleted, description: $description}';
  }
}

// provider (데이터 제공자 - 창고 관리자(1회성))
final todoProvider = Provider<Todo>(
  (ref) => Todo(isCompleted: true, description: '상태관리배우기'),
);
