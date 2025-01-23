import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo_item.dart';

// 1. 뷰 모델을 사용하고 있다
// 2. 뷰 모델에 날개를 달아주자(riverpod 상태관리 기능 추가)
// 3. 우리의 규칙 뷰 모델 - 창고의 역할도 한다
// 4. get, set 사용하지 말자
class TodoListViewModel extends Notifier<List<TodoItem>> {
  // List<TodoItem> _items = []; // 초기값

  @override
  List<TodoItem> build() {
    return [];
  }

  // 비지니스 로직
  void addItem(String title) {
    // state.add <-- 원래 사용하는 게 있는 객체에 접근해서 추가 했더니
    // 위젯 변경이 안 되었다, 하지만 새로운 객체를 만들어서 할당 하니
    // 위젯 변경이 일어났다
    state = [...state, TodoItem(title: title)];
  }

  /*
  // 상태관리를 다룰 때 불변 객체, 가변 객체란?
  // 의도치 않은 에러를 막기 위한 불변 객체
  void toggleItem(TodoItem todo) {
    state = [
      for (final item in state)
        if (item == todo)
          TodoItem(
            title: item.title,
            isDone: !item.isDone, // 속성 반전
          )
        else
          item
    ];
  }
   */

  void toggleItem(TodoItem todo) {
    state = state
        .map(
            (item) => item == todo ? item.copyWith(isDone: !item.isDone) : item)
        .toList();
  }

  // 불변성 원칙 위배(버그 위험 증가)
  // 기존 리스트의 참조를 유지한 채, 리스트 안에 특정 객체의 속성을 직접 수정하는 것
  // flutter 상태 관리에서는 가변 객체 대신 불변 객체를 사용한다
}

// 3. 창고 관리자를 만들고 관리할 창고를 설정해주자
final todoListViewModelProvider =
    NotifierProvider<TodoListViewModel, List<TodoItem>>(
  () {
    return TodoListViewModel();
  },
);
