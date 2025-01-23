import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/common.utils/logger.dart';

import 'inherited_parent.dart';

class BookListPage extends StatelessWidget {
  BookListPage({super.key});

  // 임시 데이터
  final List<String> books = ['호모사피엔스', '다트입문', '홍길동전', '코드리팩토링', '전치사도감'];

  @override
  Widget build(BuildContext context) {
    // buildContext 를 사용하여 우리가 정의한 InheritedParent 위젯에 접근할 수 있음
    InheritedParent? inheritedParent =
        context.dependOnInheritedWidgetOfExactType();

    List<String> selectedBook =
        inheritedParent?.state ?? []; // 중요 : 상태 관리시 초기값 설정!

    return inheritedParent == null
        ? Center(child: Text('Data Null'))
        : ListView(
            children: books.map(
              (book) {
                final isSelectedBool = selectedBook.contains(book);
                return ListTile(
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                  title: Text(
                    book,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      inheritedParent.onPressed(book);
                    },
                    icon: Icon(
                      isSelectedBool ? Icons.remove_circle : Icons.add,
                      color: isSelectedBool ? Colors.red : Colors.green,
                    ),
                  ),
                );
              },
            ).toList(),
          );
  }
}
