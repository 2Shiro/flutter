import 'package:flutter/material.dart';

import 'inherited_parent.dart';

class BookCartPage extends StatelessWidget {
  const BookCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    InheritedParent? inheritedParent =
        context.dependOnInheritedWidgetOfExactType();

    List<String> selectedBook =
        inheritedParent?.state ?? []; // 중요 : 상태 관리시 초기값 설정!

    return ListView(
      children:
          selectedBook.map((book) => ListTile(title: Text(book))).toList(),
    );
  }
}
