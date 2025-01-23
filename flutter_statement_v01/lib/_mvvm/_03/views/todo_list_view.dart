import 'package:flutter/material.dart';

import '../models/todo_item.dart';
import '../view_models/todo_list_view_model.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  TodoListViewModel _listViewModel = TodoListViewModel();
  TextEditingController _textController = TextEditingController();

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
                    _listViewModel.addItem(_textController.text);
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
                final TodoItem item = _listViewModel.items[index];
                return ListTile(
                  title: Text('${item.title}'),
                  trailing: Checkbox(
                    value: item.isDone,
                    onChanged: (value) {
                      _listViewModel.toggleItem(item);
                      setState(() {});
                    },
                  ),
                );
              },
              itemCount: _listViewModel.items.length,
            ),
          )
        ],
      ),
    );
  }
}
