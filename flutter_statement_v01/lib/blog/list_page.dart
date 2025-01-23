import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final Function onSelectedBook;

  final List<String> selectedBook;

  final List<String> books = ['호모사피엔스', '다트입문', '홍길동전', '코드리팩토링', '전치사도감'];

  ListPage(
      {required this.onSelectedBook, required this.selectedBook, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: books.map((book) {
        final isSelectedBool = selectedBook.contains(book);
        return ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          title: Text(
            book,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            onPressed: () {
              onSelectedBook(book);
            },
            icon: Icon(isSelectedBool ? Icons.remove_circle : Icons.add),
            color: isSelectedBool ? Colors.red : Colors.green,
          ),
        );
      }).toList(),
    );
  }
}
