import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<String> selectedBook;

  const CartPage(this.selectedBook, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
          selectedBook.map((book) => ListTile(title: Text(book))).toList(),
    );
  }
}
