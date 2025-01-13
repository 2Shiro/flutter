import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Align(
            alignment: Alignment.center, // 여기서 변경할 수 있습니다
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  width: 400,
                  height: 400,
                  color: Colors.blue,
                ),
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.red,
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.deepOrange,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
