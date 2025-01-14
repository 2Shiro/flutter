import 'package:dio/dio.dart';
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
      home: SafeArea(
        child: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 통신을 담당하는 클라이언트 측 객체를 가져오자
  Dio _dio = Dio();
  // 모델링한 타입 추가
  Todo? _todo;

  @override
  void initState() {
    super.initState();
    // 객체 실행시 한번 호출 메서드
    _fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _todo == null
          ? CircularProgressIndicator()
          : Column(
              children: [
                Text('ID : ${_todo!.id}'),
                Text('userId : ${_todo!.userId}'),
                Text('TITLE : ${_todo!.title}'),
                Text('COMPLETED : ${_todo!.completed}'),
              ],
            ),
    );
  }

  // 통신을 담당하는 메서드를 만들어 보자
  _fetchTodos() async {
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/todos/1');
      // 멤버 변수 값을 담는다
      _todo = Todo.fromJson(response.data);
      setState(() {});
    } catch (e) {
      print('실행 시점의 예외 발생');
      print(e.toString());
    }
  }
}

// dart 는 null 값을 받지 않음
class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  // dart 생성자 -> 명명된 생성자
  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        completed = json['completed'];

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}
