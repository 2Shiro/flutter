import '../models/todo_item.dart';

class TodoListViewModel {
  List<TodoItem> _items = []; // 초기값

  // get
  List<TodoItem> get items => _items;

  // add
  void addItem(String title) {
    _items.add(TodoItem(title: title));
  }

  void toggleItem(TodoItem todo) {
    todo.isDone = !todo.isDone;
  }
}
