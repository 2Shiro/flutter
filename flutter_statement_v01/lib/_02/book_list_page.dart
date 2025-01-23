import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/common.utils/logger.dart';

class BookListPage extends StatelessWidget {
  final Function(String) onToggleSaved;

  final List<String> selectedBook;

  BookListPage(
      {required this.onToggleSaved, required this.selectedBook, super.key});

  // 임시 데이터
  final List<String> books = ['호모사피엔스', '다트입문', '홍길동전', '코드리팩토링', '전치사도감'];

  @override
  Widget build(BuildContext context) {
    logger.d('데이터 확인 : ${selectedBook.toString()}');
    return ListView(
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
                onToggleSaved(book);
              },
              icon: Icon(isSelectedBool ? Icons.remove_circle : Icons.add),
              color: isSelectedBool ? Colors.red : Colors.green,
            ),
          );
        },
      ).toList(),
    );
  }
}
