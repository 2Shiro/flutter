import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_mvvm/_02/models/todo_item.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  TextEditingController _textController = TextEditingController();

  // 샘플 데이터
  List<TodoItem> _todoItems = [
    TodoItem(title: '할일 1'),
    TodoItem(title: '할일 2'),
    TodoItem(title: '할일 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter Todo item...',
                suffixIcon: IconButton(
                  onPressed: () {
                    _todoItems.add(TodoItem(title: _textController.text));
                    _textController.clear();
                    setState(() {});
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final TodoItem item = _todoItems[index];
                return ListTile(
                  title: Text('${item.title}'),
                  trailing: Checkbox(
                    value: item.isDone,
                    onChanged: (value) {
                      item.isDone = !item.isDone;
                      setState(() {});
                    },
                  ),
                );
              },
              itemCount: _todoItems.length,
            ),
          )
        ],
      ),
    );
  }
}
