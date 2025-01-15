import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/product_item.dart';
import '../../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Text('좌동'),
            const SizedBox(width: 4.0),
            Icon(
              Icons.keyboard_arrow_down,
              size: 25,
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(
            thickness: 0.5,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bell),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductItem(product: productList[index]);
        },
        separatorBuilder: (context, index) => Divider(
          thickness: 0.1,
          indent: 20,
          endIndent: 20,
        ),
      ),
    );
  }
}
