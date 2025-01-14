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

  @override
  void initState() {
    super.initState();
    // 객체 실행시 한번 호출 메서드
    _fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  // 통신을 담당하는 메서드를 만들어 보자
  _fetchTodos() async {
    // https://jsonplaceholder.typicode.com/todos/1
    // 통신을 담당하는 코드를 기본적으로 예외처리를 꼭 넣자
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/todos/1');
      print('HTTP status code : ${response.statusCode}');
      print('서버측 전달한 데이터 : ${response.data}');
      print(
          'json 통신 후 dart 에서는 어떤 타입으로 변경 되었을까? : ${response.data.runtimeType}');
      print('----------------------------------------------------------------');
      print('data -> userId 값 확인 : ${response.data['userId']}');
      print('data -> id 값 확인 : ${response.data['id']}');
      print('data -> title 값 확인 : ${response.data['title']}');
      print('data -> completed 값 확인 : ${response.data['completed']}');
      print('----------------------------------------------------------------');
      Todo todo = Todo(
          userId: response.data['userId'],
          id: response.data['id'],
          title: response.data['title'],
          completed: response.data['completed']);
      print(todo);
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
